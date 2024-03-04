import 'dart:convert';
import 'dart:io';

import 'package:bmi_calculator/models/person.dart';

import '../enum/bmi_category.dart';

void main(List<String> arguments) {
  print("!-- Bem vindo a Calculadora IMC --!");
  print("Informe seu nome:");
  var line = stdin.readLineSync(encoding: utf8);
  var nome = line;

  print("Informe o seu peso:");
  line = stdin.readLineSync(encoding: utf8);
  var peso = double.parse(line ?? "0");
  print("Informe a sua altura:");
  line = stdin.readLineSync(encoding: utf8);
  var altura = double.parse(line ?? "0");
  var person = Person(nome, peso, altura);
  var bmiResult = calculation(person);
  var conclusion = getCategory(bmiResult);

  var resultMsg = buildResultImc(conclusion);
  print("${person.name} aqui está seu resultado:");
  print("--> $resultMsg <--");
}

String buildResultImc(BmiCategory conclusion) {
  switch (conclusion) {
    case BmiCategory.SEVERE_THINNESS:
      return "Magreza Grave";
    case BmiCategory.MODERATE_THINNESS:
      return "Magreza Moderada";
    case BmiCategory.LIGHT_THINNESS:
      return "Magreza Leve";
    case BmiCategory.HEALTHY:
      return "Saudável";
    case BmiCategory.OVERWEIGHT:
      return "Sobrepeso";
    case BmiCategory.GRADE_I_OBESITY:
      return "Obesidade Grau I";
    case BmiCategory.SEVERE_GRADE_II_OBESITY:
      return "Obesidade Grau II (severa)";
    case BmiCategory.MORBID_GRADE_III_OBESITY:
      return "Obesidade Grau III (morbida)";
    default:
      print("Erro ao calular resultado!");
      exit(0);
  }
}

BmiCategory getCategory(double bmiResult) {
  late BmiCategory category;
  if (bmiResult < 16) {
    category = BmiCategory.SEVERE_THINNESS;
  }
  if (bmiResult >= 16 && bmiResult < 17) {
    category = BmiCategory.MODERATE_THINNESS;
  }
  if (bmiResult >= 17 && bmiResult < 18.5) {
    category = BmiCategory.LIGHT_THINNESS;
  }
  if (bmiResult >= 18.5 && bmiResult < 25) {
    category = BmiCategory.HEALTHY;
  }
  if (bmiResult >= 25 && bmiResult < 30) {
    category = BmiCategory.OVERWEIGHT;
  }
  if (bmiResult >= 30 && bmiResult < 35) {
    category = BmiCategory.GRADE_I_OBESITY;
  }
  if (bmiResult >= 35 && bmiResult < 40) {
    category = BmiCategory.SEVERE_GRADE_II_OBESITY;
  }
  if (bmiResult > 40) {
    category = BmiCategory.MORBID_GRADE_III_OBESITY;
  }
  return category;
}

double calculation(Person person) {
  if (person.weight == 0 || person.height == 0) {
    print("Dados inválidos!");
    throw ArgumentError("O peso/altura não pode ser zero");
  }
  var result = person.weight / (person.height * person.height);
  print("Carregando...");
  return result;
}
