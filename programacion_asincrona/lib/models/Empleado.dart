// models/empleado.dart
class Empleado {
  final int id;
  final String nombre1;
  final String? nombre2;
  final String apellido1;
  final String? apellido2;
  final String? celular;

  Empleado({
    required this.id,
    required this.nombre1,
    this.nombre2,
    required this.apellido1,
    this.apellido2,
    this.celular,
  });

  // Método para crear un objeto Empleado a partir de un JSON
  factory Empleado.fromJson(Map<String, dynamic> json) {
    return Empleado(
       id: int.parse(json['id'].toString()),  
      nombre1: json['nombre1'],
      nombre2: json['nombre2'],
      apellido1: json['apellido1'],
      apellido2: json['apellido2'],
      celular: json['celular'],





      
    );
  }
}
