import 'dart:ui';

import 'package:flutter/material.dart';
import 'employee.dart';
import 'employee_bloc.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }


}

class _HomePageState extends State<HomePage> {

  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pattern Bloc"),
      ),
      body: StreamBuilder<List<Employee>>(
        stream: _employeeBloc.employeeListStream,
        builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5.0,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${snapshot.data?[index].getId}.",
                          style: const TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${snapshot.data?[index].getName}",
                          style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                          Text("\$ ${snapshot.data?[index].getSalary.toInt()}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
                          softWrap: true)
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: IconButton(
                        icon: const Icon(Icons.thumb_up),
                        color: Colors.green,
                        onPressed: () {
                          _employeeBloc.employeeSalaryIncrement.add(snapshot.data![index]);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: IconButton(
                        icon: const Icon(Icons.thumb_down),
                        color: Colors.red,
                        onPressed: () {
                          _employeeBloc.employeeSalaryDecrement.add(snapshot.data![index]);
                        },
                      ),
                    )
                  ],
                )
              );
            },
          );
        },
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _employeeBloc.dispose();
  }

}