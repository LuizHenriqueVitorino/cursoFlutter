main(){
  Map<String, double> notas = {
    'Luiz' : 8.5,
    'Maria' : 9.0,
    'João' : 7.5,
    'Ana' : 10.0,
    'Pedro' : 6.0,
    'Carlos' : 5.5
  };

  for (var chave in notas.keys) {
    print ('Chave = $chave');
  }

  for (var valor in notas.values){
    print ('Valor =$valor');
  }

  for (var registro in notas.entries){
    if (registro.value < 7){
      continue;
    }
    print ('O(a) aluno(a) ${registro.key} está com a nota ${registro.value} no boletim');
  }
}