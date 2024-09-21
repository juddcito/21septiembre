
import 'package:flor_amarilla/flor_screen.dart';
import 'package:flutter/material.dart';

class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      mostrarDialogo();
    });
    
  }

  void mostrarDialogo() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black,
      builder:(context) {
        return AlertDialog(
          title: const Text('Mi bebito 💚'),
          content: const Text('Aquí tienes un regalo por ser el noviecito más lindo del mundo.'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const FlorScreen()));
              },
              child: const Text('Comenzar')
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}