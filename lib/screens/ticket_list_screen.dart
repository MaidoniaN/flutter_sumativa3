// lib/screens/ticket_list_screen.dart

import 'package:flutter/material.dart';
import '../data/mock_data.dart'; // Importamos la "Base de Datos" (lista en memoria)
import 'login_screen.dart'; // Para el Logout
import 'create_ticket_screen.dart'; // Para navegar a crear
import 'ticket_detail_screen.dart'; // Para navegar al detalle

/// Pantalla Principal (Dashboard).
/// Es un StatefulWidget OBLIGATORIAMENTE.
/// ¿Por qué? Porque la lista de tickets cambia. Si agregamos un ticket en la otra pantalla
/// y volvemos, esta pantalla debe "repintarse" para mostrar el nuevo elemento.
class TicketListScreen extends StatefulWidget {
  const TicketListScreen({super.key});

  @override
  State<TicketListScreen> createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  /// Método auxiliar para forzar la actualización de la pantalla.
  /// Se llama justo después de volver de "Crear" o "Detalle".
  void _refresh() {
    setState(() {
      // setState vacío es suficiente para decirle a Flutter:
      // "Oye, los datos globales (tickets) cambiaron, vuelve a ejecutar build()"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- BARRA SUPERIOR ---
      appBar: AppBar(
        title: const Text('Tickets Pendientes'),
        actions: [
          // Botón de Logout
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Usamos pushReplacement para borrar el historial de navegación.
              // Así el usuario no puede volver a esta lista presionando "Atrás".
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),

      // --- CUERPO: LISTA DINÁMICA ---
      // Usamos ListView.builder en lugar de un ListView normal.
      // El .builder es más eficiente (Lazy Loading): solo dibuja los elementos
      // que caben en la pantalla, ahorrando memoria si la lista es enorme.
      body: ListView.builder(
        itemCount:
            tickets.length, // Le dice al constructor cuántas veces debe iterar
        itemBuilder: (context, index) {
          // Extraemos el ticket actual según el índice (0, 1, 2...)
          final ticket = tickets[index];

          // Lógica visual simple para determinar si está cerrado
          final esCerrado = ticket['estado'] == 'Cerrado';

          // Retornamos el diseño de cada fila
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              // Icono a la izquierda (Leading)
              leading: Icon(
                esCerrado ? Icons.check_circle : Icons.error,
                color: esCerrado ? Colors.green : Colors.red,
              ),

              // Textos principales
              title: Text(ticket['titulo']),
              subtitle: Text(
                "${ticket['autor']} - ${ticket['estado']} - ${ticket['fecha']}",
              ),

              // Icono a la derecha (Trailing) indicando que es "clickeable"
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),

              // --- NAVEGACIÓN ASÍNCRONA (CLAVE PARA TU NOTA) ---
              onTap: () async {
                // 1. Navegamos a la pantalla de detalle.
                // Usamos 'await': El código se "congela" aquí y espera a que
                // la pantalla TicketDetailScreen se cierre (haga pop).
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketDetailScreen(ticket: ticket),
                  ),
                );

                // 2. Esta línea solo se ejecuta CUANDO volvemos del detalle.
                // Como es posible que hayamos cerrado el ticket allá,
                // llamamos a _refresh() para actualizar el icono de esta lista.
                _refresh();
              },
            ),
          );
        },
      ),

      // --- BOTÓN FLOTANTE (FAB) ---
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // Misma lógica asíncrona: Esperamos a que el usuario termine de crear.
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTicketScreen()),
          );
          // Al volver, refrescamos la lista para mostrar el nuevo ticket.
          _refresh();
        },
      ),
    );
  }
}
