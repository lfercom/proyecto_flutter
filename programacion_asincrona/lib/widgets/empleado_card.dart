// widgets/empleado_card.dart
import 'package:flutter/material.dart';
import '../models/empleado.dart';

class EmpleadoCard extends StatelessWidget {
  final Empleado empleado;

  EmpleadoCard({required this.empleado});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${empleado.nombre1} ${empleado.apellido1}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (empleado.nombre2 != null)
              Text('Segundo Nombre: ${empleado.nombre2}'),
            if (empleado.apellido2 != null)
              Text('Segundo Apellido: ${empleado.apellido2}'),
            if (empleado.celular != null) Text('Celular: ${empleado.celular}'),
          ],
        ),
        tileColor: Colors.blue
      ),
    );
  }
}
