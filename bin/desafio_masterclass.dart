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

//Desafio 3
// Uma das coisas mais úteis que aprendemos no ensino médio é a "Regra de 3".
// Consiste quando temos 3 valores e precisamos saber o quarto.
// Geralmente temos dois grupos, e o calculo é feito multiplicando
//paralelamente os valores entre os dois grupos. Ex:
// --
// Grupo1.1             Grupo1.2
//                    X
// Grupo2.1            Grupo2.2
// --
// Grupo1.1 x Grupo2.2 = Grupo2.1 x Grupo1.2
//Sabendo disso, crie uma função que receba 4 argumentos opcionais e que retorne a resolução da regra de 3,
//levando em consideração que será considerado o argumento vário como valor a ser encontrado, logo,
//poderá ter apenas um valor necessáriamente "vazio".

void main(List<String> arguments) {
  bool iniciarDesafio = true;
  while (iniciarDesafio) {
    print("\nMenu do desafio\n");
    print("1.Calcular seu IMC");
    print("2.Criar uma sequencia de Fibonacci");
    print("3.Calcular com a regra de três");
    print("4.Sair\n");

    var desafio = lerValor("Informe o que deseja fazer: ");

    if (desafio == "1") {
      print("\n1.Calcular seu IMC");
      calcularIMC();
    } else if (desafio == "2") {
      print("\n2.Criar uma sequencia de Fibonacci");
      fibonacci();
    } else if (desafio == "3") {
      print("\n3.Calcule o valor de 'x' com a regra de três:");
      print(
          "(Deixe vazio ou marque 'x' onde encontra-se o valor desconhecido)\n");
      regraDeTres();
    } else if (desafio == "sair" || desafio == "4") {
      iniciarDesafio = false;
    }
  }
}

void calcularIMC() {
  var peso = int.parse(lerValor("Digite seu peso (ex.: 55): "));
  var altura = double.parse(
      lerValor("Digite sua altura (ex.: 1.50): ").replaceAll(',', '.'));

  var imc = peso / pow(altura, 2);

  print("Seu imc é: ${imc.toStringAsFixed(2)}");
}

void fibonacci() {
  var tamanhoSeq = int.parse(
      lerValor("Informe o tamanho da sequência que deseja (ex.:10): "));

  for (var i = 0; i < tamanhoSeq; i++) {
    print(fibSeq(i));
  }
}

void regraDeTres() {
  var primeiroValor = lerValor("Digite o primeiro valor do grupo 1.1: ");
  var segundoValor = lerValor("Digite o segundo valor do grupo 1.2: ");
  var terceiroValor = lerValor("Digite o primeiro valor do grupo 2.1: ");
  var quartoValor = lerValor("Digite o segundo valor do grupo 2.2: ");

  print("\n--");
  print(" Grupo1.1            Grupo1.2");
  print(" ($primeiroValor)                ($segundoValor)");
  print("              X              ");
  print(" Grupo2.1            Grupo2.2");
  print(" ($terceiroValor)                ($quartoValor)");
  print("--");

  var primeiroGrupo = [
    primeiroValor.toLowerCase() == ("x")
        ? ""
        : primeiroValor.replaceAll(',', '.'),
    segundoValor.toLowerCase() == ("x") ? "" : segundoValor.replaceAll(',', '.')
  ];
  var segundoGrupo = [
    terceiroValor.toLowerCase() == ("x")
        ? ""
        : terceiroValor.replaceAll(',', '.'),
    quartoValor.toLowerCase() == ("x") ? "" : quartoValor.replaceAll(',', '.')
  ];

  var primeiroGrupoPossuiVazio = primeiroGrupo.any((valor) => valor == "");
  var segundoGrupoPossuiVazio = segundoGrupo.any((valor) => valor == "");

  if (primeiroGrupoPossuiVazio && segundoGrupoPossuiVazio ||
      primeiroValor == "" && segundoValor == "" ||
      terceiroValor == "" && quartoValor == "") {
    print('\nAtenção: Pelo menos três valores devem ser preenchidos!');
    return regraDeTres();
  }

  num primeiroMultiplicador = 0;
  num segundoMultiplicador = 0;
  num dividendo = 0;

  if (primeiroGrupoPossuiVazio || segundoGrupoPossuiVazio) {
    if (primeiroGrupoPossuiVazio) {
      var index = primeiroGrupo.indexOf("");
      primeiroMultiplicador = num.parse(segundoGrupo[index]);
      segundoMultiplicador = num.parse(primeiroGrupo[index == 0 ? 1 : 0]);
      dividendo = num.parse(segundoGrupo[index == 0 ? 1 : 0]);
    } else {
      var index = segundoGrupo.indexOf("");
      primeiroMultiplicador = num.parse(primeiroGrupo[index]);
      segundoMultiplicador = num.parse(segundoGrupo[index == 0 ? 1 : 0]);
      dividendo = num.parse(primeiroGrupo[index == 0 ? 1 : 0]);
    }

    var resultado = (primeiroMultiplicador * segundoMultiplicador) / dividendo;

    if (dividendo == 0) {
      print(
          "\nAtenção: Não é possível dividir por zero! Insira os valores novamente.");
      return regraDeTres();
    } else {
      print("\nO valor de 'x' é: ${resultado.toStringAsFixed(1)}");
    }
  } else {
    print(
        "\nAtenção: Todos os valores foram preenchidos, você já sabe qual o valor de 'x'!");
  }
}

int fibSeq(int i) {
  if (i < 2) {
    return i;
  } else {
    return fibSeq(i - 1) + fibSeq(i - 2);
  }
}

String lerValor(String mensagem) {
  stdout.write(mensagem);
  return stdin.readLineSync() ?? "";
}
