class Produto {
  String? nome;
  double? preco;

  Produto({this.nome, this.preco});
  // Produto(String nome, double preco){
  //   this.nome = nome;
  //   this.preco = preco;
  // }

  void mensagem () => print('O produto $nome custa R\$$preco reais');
}

main() {
  var p1 = Produto(nome: 'Caneta', preco: 4.99);
  var p2 = Produto(preco: 3999.99, nome: 'Geladeira');
  // p1.nome = 'Lapis';
  // p1.preco = 2.50;

  p1.mensagem();
  p2.mensagem();
}