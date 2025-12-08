// lib/screens/create_ticket_screen.dart

import 'package:flutter/material.dart';
// Importamos mock_data porque necesitamos acceder a la variable 'tickets'
// para agregar el nuevo elemento a la lista.
import '../data/mock_data.dart';

/// Pantalla encargada de mostrar el formulario de creación de un nuevo ticket.
/// Es un StatelessWidget porque la estructura del formulario no cambia dinámicamente;
/// el texto que escribe el usuario es manejado por los controladores.
class CreateTicketScreen extends StatelessWidget {
  const CreateTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // --- CONTROLADORES DE TEXTO ---
    // Son objetos que "escuchan" y almacenan lo que el usuario escribe en los campos de texto.
    // Nos servirán para recuperar el valor final cuando se presione "Guardar".
    final tituloController = TextEditingController();
    final descController = TextEditingController();

    return Scaffold(
      // AppBar estándar con el título de la pantalla
      appBar: AppBar(title: const Text('Nuevo Ticket')),

      // Padding agrega un margen interno de 16 pixeles en todos los lados
      // para que el formulario no quede pegado a los bordes de la pantalla.
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // Usamos Column para organizar los elementos (Inputs y Botón) verticalmente.
        child: Column(
          children: [
            // --- CAMPO 1: TÍTULO ---
            TextField(
              controller:
                  tituloController, // Vinculamos el input con su controlador
              decoration: const InputDecoration(
                labelText: 'Título del problema', // Etiqueta flotante
                border: OutlineInputBorder(), // Dibuja un recuadro alrededor
              ),
            ),

            // SizedBox actúa como un separador vertical invisible (espacio en blanco)
            const SizedBox(height: 15),

            // --- CAMPO 2: DESCRIPCIÓN ---
            TextField(
              controller: descController,
              maxLines:
                  3, // Permite que el campo sea más alto para escribir párrafos
              decoration: const InputDecoration(
                labelText: 'Descripción detallada',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // --- BOTÓN DE ACCIÓN ---
            ElevatedButton(
              onPressed: () {
                // AQUÍ OCURRE LA MAGIA DEL GUARDADO

                // 1. Lógica de "Insert": Agregamos un mapa (JSON) a nuestra lista en memoria.
                // En el futuro, aquí iría la petición HTTP POST a Flask.
                // Obtenemos la fecha y hora actual del dispositivo.
                final DateTime now = DateTime.now();
                // Formateamos manualmente a String (Día/Mes/Año) para guardarlo simple.
                // Nota académica: En una app real usaríamos la librería 'intl' para formatear,
                // pero esto funciona perfecto para un prototipo sin dependencias extra
                String fechaFormateada = "${now.year}-${now.month}-${now.day}";

                tickets.add({
                  // Generamos un ID simple basado en el largo actual de la lista + 1
                  'id': tickets.length + 1,
                  // Recuperamos el texto real escrito por el usuario usando .text
                  'titulo': tituloController.text,
                  'descripcion': descController.text,
                  // Valores por defecto para un ticket nuevo
                  'estado': 'Abierto',
                  'autor': 'Usuario Actual', // Hardcoded por ahora
                  'fecha': fechaFormateada, // <--- GUARDAMOS LA FECHA GENERADA
                });

                // 2. Navegación:
                // Navigator.pop(context) cierra la pantalla actual (como un botón "Atrás")
                // y nos devuelve a la pantalla anterior (el Listado).
                Navigator.pop(context);
              },
              child: const Text('GUARDAR TICKET'),
            ),
          ],
        ),
      ),
    );
  }
}
