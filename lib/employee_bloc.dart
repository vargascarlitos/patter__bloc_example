import 'dart:async';
import 'employee.dart';

class EmployeeBloc {
  final List<Employee> _employeeList = [
    Employee(1, 5000, "Carlos"),
    Employee(2, 6000, "Romi"),
    Employee(3, 4000, "Lucas"),
    Employee(4, 2000, "Raul"),
    Employee(5, 6000, "Esteban"),
    Employee(6, 8000, "Vicente")
  ];

  /// El Stream Controller que muestra la data completa en este caso
  /// espera recibir una lista de [Employee]
  final _employeeListStreamController = StreamController<List<Employee>>();

  /// El Stream Controller para incrementar el salario de un empleado
  /// en este caso espera recibir un [Employee]
  final _employeeIncrementSalarySteamController = StreamController<Employee>();

  /// El StreamController que decrementa el salrio de un empleado
  /// en este caso espera recibir un [Employee]
  final _employeeDecrementSalaryStreamController = StreamController<Employee>();

  /// Ahora se tiene que crear lo que representaria la salida del [EmployeeBloc]
  /// Se le suele llamar getters o stream que representaria la salida o el output del bloc
  Stream<List<Employee>> get employeeListStream => _employeeListStreamController.stream;
  StreamSink<List<Employee>> get employeeListSink => _employeeListStreamController.sink;
  StreamSink<Employee> get employeeSalaryIncrement => _employeeIncrementSalarySteamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement => _employeeDecrementSalaryStreamController.sink;
  
  /// Constructor
  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);
    _employeeIncrementSalarySteamController.stream.listen(_incrementSalary);
    _employeeDecrementSalaryStreamController.stream.listen(_decrementSalary);
  }
  
  /// Principal Functions or logic functions
  _incrementSalary(Employee employee) {
    double actuallySalary = employee.getSalary;
    double incrementSalary = actuallySalary * 20/100;

    _employeeList[employee.getId - 1].salary = actuallySalary + incrementSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double actuallySalary = employee.getSalary;
    double incrementSalary = actuallySalary * 20/100;

    _employeeList[employee.getId - 1].salary = actuallySalary - incrementSalary;
    employeeListSink.add(_employeeList);
  }

  void dispose() {
    _employeeIncrementSalarySteamController.close();
    _employeeDecrementSalaryStreamController.close();
    _employeeListStreamController.close();
  }
}
