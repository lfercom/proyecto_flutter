// screens/empleado_screen.dart
import 'package:flutter/material.dart';
import 'package:programacion_asincrona/widgets/empleado_card.dart';
import '../models/empleado.dart';
import '../services/empleado_service.dart';

class EmpleadoScreen extends StatefulWidget {
  @override
  _EmpleadoScreenState createState() => _EmpleadoScreenState();
}

class _EmpleadoScreenState extends State<EmpleadoScreen> {
  late Future<List<Empleado>> futureEmpleados;

  @override
  void initState() {
    super.initState();
    futureEmpleados = EmpleadoService().fetchEmpleados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Empleados'),
      ),
      body: FutureBuilder<List<Empleado>>(
        future: futureEmpleados,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No hay empleados disponibles"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return EmpleadoCard(empleado: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }
}
