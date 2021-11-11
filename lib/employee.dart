import 'package:flutter/cupertino.dart';

class Employee {
  late int _id;
  late String _name;
  late double _salary;

  Employee(this._id, this._salary, this._name);

  set id(int id) {
    _id = id;
  }

  set name(String name) {
    _name = name;
  }

  set salary(double salary) {
    _salary = salary;
  }


  int get getId => _id;

  String get getName => _name;

  double get getSalary => _salary;

}