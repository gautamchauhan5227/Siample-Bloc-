import 'package:bloc/model/employee_model.dart';
import 'api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<EmployeeDetails> fetchEmployeeData() => appApiProvider.fetchEmployeeData();
}
