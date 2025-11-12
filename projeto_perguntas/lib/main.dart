import 'package:flutter/material.dart';

void main() {
  runApp(PerguntaApp());
}

class 
_PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder(){
    setState(() {
      _perguntaSelecionada ++;
      if (_perguntaSelecionada > 1) {
        _perguntaSelecionada = 0;
      };
    });
    print(_perguntaSelecionada);
  }

  void Function() _resposta(String resposta){
    return () {
      _responder();
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
            Text(perguntas[_perguntaSelecionada]),
            TextButton(
              onPressed: _resposta('CORRETA'), 
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 0, 0, 255),
                foregroundColor: Colors.white
              ),
              child: Text('Azul')
              ),
            TextButton(
              onPressed: _resposta('INCORRETA'), 
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 0, 0),
                foregroundColor: Colors.white
              ),
              child: Text('Vermelho')
              ),
            TextButton(
              onPressed: _resposta('INCORRETA'), 
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

class PerguntaApp extends StatefulWidget{
  const PerguntaApp({super.key});
  
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }

}