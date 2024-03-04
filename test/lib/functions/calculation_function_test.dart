import 'package:bmi_calculator/enum/bmi_category.dart';
import 'package:bmi_calculator/functions/calculation_function.dart' as app;
import 'package:bmi_calculator/models/person.dart';
import 'package:test/test.dart';

void main() {
  test('buildResultImc', () {
    expect(app.buildResultImc(BmiCategory.SEVERE_THINNESS), "Magreza Grave");
    expect(
        app.buildResultImc(BmiCategory.MODERATE_THINNESS), "Magreza Moderada");
    expect(app.buildResultImc(BmiCategory.LIGHT_THINNESS), "Magreza Leve");
    expect(app.buildResultImc(BmiCategory.HEALTHY), "Saudável");
    expect(app.buildResultImc(BmiCategory.OVERWEIGHT), "Sobrepeso");
    expect(app.buildResultImc(BmiCategory.GRADE_I_OBESITY), "Obesidade Grau I");
    expect(app.buildResultImc(BmiCategory.SEVERE_GRADE_II_OBESITY),
        "Obesidade Grau II (severa)");
    expect(app.buildResultImc(BmiCategory.MORBID_GRADE_III_OBESITY),
        "Obesidade Grau III (morbida)");
  });

  test('getCategory', () {
    expect(app.getCategory(14), BmiCategory.SEVERE_THINNESS);
    expect(app.getCategory(26), BmiCategory.OVERWEIGHT);
    expect(app.getCategory(37), BmiCategory.SEVERE_GRADE_II_OBESITY);
  });

  test('Calcula o IMC com peso e altura zero', () {
    Person person = Person('Teste', 0.0, 0.0);
    expect(
        () => app.calculation(person), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o IMC com peso zero', () {
    Person person = Person('Teste', 0.0, 1.60);
    expect(
        () => app.calculation(person), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o IMC com altura zero', () {
    Person person = Person('Teste', 89.0, 0.0);
    expect(
        () => app.calculation(person), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o IMC com os valores de peso e altura', () {
    Person person = Person('Teste', 65.0, 1.60);
    expect(app.calculation(person), equals(25.390624999999996));
  });
}
