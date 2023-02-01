import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:band_names/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    //socketService.socket.emit(event);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ServerStatus: ${socketService.serverStatus}',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tarea
          // Emitir : emitir-menjase
          // {nombre:'Flutter', mensaje:'Hola desde Flutter'}
          socketService.emit('emitir-mensaje', {
            'nombre': 'Flutter',
            'mensaje': 'Hola desde Flutter',
          });
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
