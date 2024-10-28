// services/empleado_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/empleado.dart';

class EmpleadoService {
  final String apiUrl = "http://localhost/adsi_2902646/consultarEmpleados.php";
  

  Future<List<Empleado>> fetchEmpleados() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Empleado.fromJson(item)).toList();
    } else {
      throw Exception("Error al obtener empleados");
    }
  }
}
