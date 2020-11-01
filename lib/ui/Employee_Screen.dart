import 'package:bloc/bloc/employee_bloc.dart';
import 'package:bloc/model/employee_model.dart';
import 'package:flutter/material.dart';



class EmployeeScreen extends StatefulWidget {
  @override
  EmployeeScreenState createState() => EmployeeScreenState();
}

class EmployeeScreenState extends State<EmployeeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employeeBloc.fetchEmployeeData();
  }
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: employeeBloc.employee,
        builder: (context, AsyncSnapshot<EmployeeDetails> snapshot) {
          if (snapshot.hasData) {
            return _buildEmployeeScreen(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Container _buildEmployeeScreen(EmployeeDetails data) {
    return Container(
        padding: const EdgeInsets.all(17.0),
        child: ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  Text(data.data[i].employeeName),
                  Text(data.data[i].employeeAge),
                  Text(data.data[i].employeeSalary),
                  Text(data.data[i].id),
                ],
              );
            })
    );
  }
}


