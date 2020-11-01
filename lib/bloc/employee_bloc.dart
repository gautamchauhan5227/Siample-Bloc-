import 'package:bloc/model/employee_model.dart';
import 'package:bloc/persistence/repository.dart';
import 'package:rxdart/subjects.dart';



class EmployeeBloc {
  Repository _repository = Repository();

  /*Create a PublicSubject object responsible to add the data which is got from
  the server in the form of EmpolyeeData object and pass it to the UI screen as a stream.*/
  final _employeeFetcher = PublishSubject<EmployeeDetails>();

  //This method is used to pass the EmpolyeeData response as stream to UI
   get employee => _employeeFetcher.stream;

  fetchEmployeeData() async {
    EmployeeDetails employeeResponse = await _repository.fetchEmployeeData();
    _employeeFetcher.sink.add(employeeResponse);
  }

  dispose() {
    //Close the weather fetcher
    _employeeFetcher.close();
  }
}

final employeeBloc = EmployeeBloc();
