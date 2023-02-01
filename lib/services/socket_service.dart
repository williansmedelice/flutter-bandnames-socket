import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

enum ServerStatus {
  online,
  offline,
  connecting,
}

class SocketService extends ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late Socket _socket;

  SocketService() {
    _initConfig();
  }

  ServerStatus get serverStatus => _serverStatus;
  
  Socket get socket => _socket;
  Function get emit => _socket.emit;

  void _initConfig() {
    // Dart client
    _socket = io(
      'http://192.168.1.102:3000',
      OptionBuilder().setTransports(['websocket']).enableAutoConnect().build(),
    );

    _socket.onConnect((_) {
      // print('connect');
      _serverStatus = ServerStatus.online;
      // socket.emit('mensaje', 'test');

      notifyListeners();
    });

    // socket.on('mensaje', (data) => print(data));

    _socket.onDisconnect((_) {
      // print('disconnect');
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });

    // socket.on('nuevo-mensaje', (payload) {
    //   print('nuevo-mensaje: $payload');
    //   print('nombre: ' + payload['name']);
    //   print('mensaje: ' + payload['mensaje']);
    //   print(payload.containsKey('mensaje2')
    //       ? payload['mensaje2']
    //       : 'no hay mensaje 2');
    // });

    // socket.on('fromServer', (_) => print(_));


  }
}
