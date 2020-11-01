import 'dart:convert';
import 'package:bloc/model/employee_model.dart';
import 'package:http/http.dart' show Client;


class ApiProvider {
  Client client = Client();

  //This is the London weather API url available at this link: https://openweathermap.org/current
  final _baseUrl =
      "http://dummy.restapiexample.com/api/v1/employees";





  Future<EmployeeDetails> fetchEmployeeData() async {
    final response = await client.get("$_baseUrl"); // Make the network call asynchronously to fetch the London weather data.
    print(response.body.toString());

    if (response.statusCode == 200) {
      return EmployeeDetails.fromJson(json.decode(response.body)); //Return decoded response
    } else {
      throw Exception('Failed to load weather');
    }
  }
}