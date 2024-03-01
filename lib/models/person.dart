// ignore_for_file: public_member_api_docs, sort_constructors_first
class Person {
  String _name = '';
  double _weight = 0;
  double _height = 0;
  get name => this._name;

  Person(
    name,
    weight,
    height,
  ) {
    _name = name;
    _weight = weight;
    _height = height;
  }

  set name(value) => _name = value;

  get weight => _weight;

  set weight(value) => _weight = value;

  get height => _height;

  set height(value) => _height = value;
}
