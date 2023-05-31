import 'dart:io';
import 'dart:math';

//Desafio 1
// O (IMC) índice de massa corporal é baseado na altura e peso do individuo.
// O calculo é representado por Dividir o peso pela Altura ao quadradro²
// Cria uma função que realize o calculo de IMC.

//Desafio 2
// Na matemática, a sucessão de Fibonacci (ou sequência de Fibonacci),
// é uma sequência de números inteiros, começando normalmente por 0 e 1,
// na qual cada termo subsequente corresponde à soma dos dois anteriores.
// A sequência recebeu o nome do matemático italiano Leonardo de Pisa,
// mais conhecido por Fibonacci, que descreveu, no ano de 1202, o crescimento
//de uma população de coelhos, a partir desta.
//Esta sequência já era, no entanto, conhecida na antiguidade.

// Implemente a sequencia fibonacci com funcões recursivamente usando o Dart.

void main(List<String> arguments) {
  bool iniciarDesafio = true;
  while (iniciarDesafio) {
    print("\nMenu do desafio\n");
    print("1.Calcular seu IMC");
    print("2.Criar uma sequencia de Fibonacci");
    print("3.Sair\n");
    stdout.write("Informe o que deseja fazer: ");
    var desafio = stdin.readLineSync().toString().toLowerCase();

    if (desafio == "1") {
      calcularIMC();
    } else if (desafio == "2") {
      fibonacci();
    } else if (desafio == "sair") {
      iniciarDesafio = false;
    }
  }
}

void calcularIMC() {
  print("\n1.Calcular seu IMC");
  stdout.write("Digite seu peso (ex.: 55): ");
  var peso = int.parse(stdin.readLineSync().toString());
  stdout.write("Digite sua altura (ex.: 1.50): ");
  var altura =
      double.parse(stdin.readLineSync().toString().replaceAll(',', '.'));

  var imc = peso / pow(altura, 2);

  print("Seu imc é: ${imc.toStringAsFixed(2)}");
}

void fibonacci() {
  print("\n2.Criar uma sequencia de Fibonacci");
  stdout.write("Informe o tamanho da sequência que deseja (ex.:10): ");
  var tamanhoSeq = int.parse(stdin.readLineSync().toString());

  for (var i = 0; i < tamanhoSeq; i++) {
    print(fibSeq(i));
  }
}

int fibSeq(int i) {
  if (i < 2) {
    return i;
  } else {
    return fibSeq(i - 1) + fibSeq(i - 2);
  }
}
