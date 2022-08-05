import 'package:flutter/material.dart';
import 'package:notifications_teste/app/services/notification_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valor = false;
  bool valor2 = false;

  showNotification() {
    setState(() {
      valor = !valor;
      if (valor) {
        Provider.of<NotificationService>(context, listen: false)
            .showNotification(CustomNotification(
          id: 1,
          title: 'Teste',
          body: 'Acesse o App!',
          payload: '/notificacao',
        ));
      }
    });
  }

  showNotification2() {
    setState(() {
      valor2 = !valor2;
      if (valor2) {
        Provider.of<NotificationService>(context, listen: false)
            .showNotificationFuture(CustomNotification(
          id: 2,
          title: 'Teste2',
          body: 'Acesse o App!!!!',
          payload: '/notificacao',
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 174),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: ListTile(
                  title: const Text('Lembrar-me mais tarde'),
                  trailing: valor
                      ? Icon(Icons.check_box, color: Colors.amber.shade600)
                      : const Icon(Icons.check_box_outline_blank),
                  onTap: showNotification,
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Lembrar-me mais tarde 5s'),
                  trailing: valor2
                      ? Icon(Icons.check_box, color: Colors.amber.shade600)
                      : const Icon(Icons.check_box_outline_blank),
                  onTap: showNotification2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
