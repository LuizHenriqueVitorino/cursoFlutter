int exec(int a, int b, Function(int, int) fn){
  return fn(a, b);
}

main() {
  final r = exec(2, 3, (a, b) => a * b + 10);
  print('O resultado da soma é: $r');

}