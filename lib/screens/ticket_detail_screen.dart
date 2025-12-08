// lib/screens/ticket_detail_screen.dart

import 'package:flutter/material.dart';

/// Pantalla de Detalle.
/// Muestra la información completa de un ticket específico.
/// Es un StatefulWidget porque permite modificar el estado del ticket (cerrarlo)
/// y necesitamos que la interfaz se redibuje para reflejar ese cambio inmediatamente.
class TicketDetailScreen extends StatefulWidget {
  // Recibimos el objeto 'ticket' como parámetro desde la pantalla de lista.
  // En Flutter, pasar datos a través del constructor es la forma estándar de comunicación entre pantallas.
  final Map<String, dynamic> ticket;

  const TicketDetailScreen({super.key, required this.ticket});

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // --- LÓGICA DE PRESENTACIÓN ---
    // Calculamos una variable booleana auxiliar para facilitar la lectura del código.
    // Si el estado es 'Cerrado', esta variable será true.
    bool estaCerrado = widget.ticket['estado'] == 'Cerrado';

    return Scaffold(
      appBar: AppBar(
        // Accedemos a los datos pasados al widget usando "widget.variable"
        title: Text('Ticket #${widget.ticket['id']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alinea todo a la izquierda
          children: [
            // Título del problema
            Text(
              widget.ticket['titulo'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(
                  "Creado el :${widget.ticket['fecha']}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // --- BADGE / ETIQUETA DE ESTADO ---
            // Usamos un Container para crear una caja decorada (fondo de color y bordes redondeados)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // Usamos el operador ternario (? :) para decidir el color.
                // ¿Está cerrado? Si es sí -> Verde. Si es no -> Rojo.
                color: estaCerrado ? Colors.green[100] : Colors.red[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Estado: ${widget.ticket['estado']}",
                style: TextStyle(
                  // El color del texto también cambia dinámicamente Cerrado verde, si no, rojo
                  color: estaCerrado ? Colors.green[900] : Colors.red[900],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Sección de Descripción
            const Text(
              "Descripción:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(widget.ticket['descripcion']),

            const SizedBox(height: 20),
            const Divider(), // Una línea gris delgada para separar secciones

            const Text(
              "Acciones:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // --- RENDERIZADO CONDICIONAL ---
            // Flutter permite usar 'if' dentro de las listas de widgets.
            // Esto es muy potente: El botón SOLO se dibuja si el ticket NO está cerrado.
            if (!estaCerrado)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.check),
                label: const Text('CERRAR TICKET'),
                onPressed: () {
                  // --- LÓGICA DE ACTUALIZACIÓN ---
                  setState(() {
                    // 1. Modificamos el dato en memoria (referencia al objeto original)
                    widget.ticket['estado'] = 'Cerrado';
                  });
                  // El setState provoca que el método build se ejecute de nuevo,
                  // actualizando los colores y ocultando este botón automáticamente.

                  // 2. Feedback al usuario
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Ticket Cerrado exitosamente"),
                    ),
                  );
                },
              ),

            // Mensaje alternativo si el botón no está presente
            if (estaCerrado)
              const Text(
                "Este ticket ya está cerrado.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
