import 'package:flutter/material.dart';

void main() {
  runApp(PerguntaAP());
}

class PerguntaAP extends StatelessWidget{
  const PerguntaAP({super.key});

  void responder(){
    print('Pergunta respondida');
  }

  void Function() resposta(String resposta){
    return () {
      print('A resposta está $resposta');
    };
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a cor favorita do Luiz?',
      'Qual é o animal favorito do Luiz?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas do Luiz', 
            style: TextStyle(color: Color(0xFFFFFFFF))),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 24, 58, 119),

        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[0]),
            TextButton(
              onPressed: resposta('CORRETA'), 
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 0, 255),
                foregroundColor: Colors.white
              ),
              child: Text('Azul')
              ),
            TextButton(
              onPressed: resposta('INCORRETA'), 
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
                foregroundColor: Colors.white
              ),
              child: Text('Vermelho')
              ),
            TextButton(
              onPressed: resposta('INCORRETA'), 
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 255, 0),
                foregroundColor: Colors.white
              ),
              child: Text('Verde')
              )
          ],
        ),
      ),
    );
  }
}