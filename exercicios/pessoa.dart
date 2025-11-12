

class Pessoa {
  String? nome;
  String? _cpf;

  set cpf(String cpf) {
    this._cpf = cpf;
  }

  get cpf {
    return _cpf;
  }
}