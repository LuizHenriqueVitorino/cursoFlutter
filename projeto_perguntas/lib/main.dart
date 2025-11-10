import 'package:flutter/material.dart';

void main() {
  runApp(PerguntaAP());
}

class PerguntaAP extends StatelessWidget{
  const PerguntaAP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('Olá mundo!'),
    );
  }
}