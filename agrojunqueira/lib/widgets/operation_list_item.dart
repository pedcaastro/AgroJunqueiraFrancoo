import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../modelos/operation.dart';
import '../views/operation_details_page.dart';

class OperationListItem extends StatelessWidget {
  final Operation operation;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  OperationListItem({required this.operation});

  @override
  Widget build(BuildContext context) {
    final applicationDateDifference =
        DateTime.now().difference(operation.applicationDate).inDays;
    final executionDateDifference =
        DateTime.now().difference(operation.executionDate).inDays;

    return Card(
      child: ListTile(
        leading: Icon(Icons.agriculture),
        title: Text(operation.farmName),
        subtitle: Text(
            'Talhão: ${operation.plot}, Operação: ${operation.operationType}'),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Aplicar em: ${applicationDateDifference.abs()} dias'),
            Text('Aplicada: ${executionDateDifference.abs()} dias'),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => OperationDetailsPage(
                      operation: operation,
                    )),
          );
        },
      ),
    );
  }
}
