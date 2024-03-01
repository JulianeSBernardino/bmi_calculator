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
  calculation(person);
}

void calculation(Person person) {
  if (person.weight == 0 || person.height == 0) {
    print("Dados inválidos!");
    exit(0);
  }
  var result = person.weight / (person.height * person.height);
  print("Carregando...");

  getCategory(result, person.name);
}

void getCategory(double result, String namePerson) {
  BmiCategory? category;
  if (result < 16) {
    category = BmiCategory.SEVERE_THINNESS;
  }
  if (result >= 16 && result < 17) {
    category = BmiCategory.MODERATE_THINNESS;
  }
  if (result >= 17 && result < 18.5) {
    category = BmiCategory.LIGHT_THINNESS;
  }
  if (result >= 18.5 && result < 25) {
    category = BmiCategory.HEALTHY;
  }
  if (result >= 25 && result < 30) {
    category = BmiCategory.OVERWEIGHT;
  }
  if (result >= 30 && result < 35) {
    category = BmiCategory.GRADE_I_OBESITY;
  }
  if (result >= 35 && result < 40) {
    category = BmiCategory.SEVERE_GRADE_II_OBESITY;
  }
  if (result > 40) {
    category = BmiCategory.MORBID_GRADE_III_OBESITY;
  }
  print("$namePerson aqui está seu resultado:");

  buildResultImc(category!);
}

void buildResultImc(BmiCategory conclusion) {
  switch (conclusion) {
    case BmiCategory.SEVERE_THINNESS:
      print("--> Magreza Grave <--");
      break;
    case BmiCategory.MODERATE_THINNESS:
      print("--> Magreza Moderada <--");
      break;
    case BmiCategory.LIGHT_THINNESS:
      print("--> Magreza Leve <--");
      break;
    case BmiCategory.HEALTHY:
      print("--> Saudável <--");
      break;
    case BmiCategory.OVERWEIGHT:
      print("--> Sobrepeso <--");
      break;
    case BmiCategory.GRADE_I_OBESITY:
      print("--> Obesidade Grau I <--");
      break;
    case BmiCategory.SEVERE_GRADE_II_OBESITY:
      print("--> Obesidade Grau II (severa) <--");
      break;
    case BmiCategory.MORBID_GRADE_III_OBESITY:
      print("--> Obesidade Grau III (morbida) <--");
      break;
    default:
      print("Erro ao calular resultado!");
      exit(0);
  }
}
