import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../modelos/operation.dart';

class OperationDetailsPage extends StatelessWidget {
  final Operation operation;

  OperationDetailsPage({required this.operation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Operação'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text('Número do Receituário'),
                subtitle: Text(operation.prescriptionNumber),
              ),
              ListTile(
                title: Text('Status operacional'),
                subtitle: Text(operation.operationalStatus),
              ),
              ListTile(
                title: Text('Código da Fazenda'),
                subtitle: Text(operation.farmCode),
              ),
              ListTile(
                title: Text('Nome da Fazenda'),
                subtitle: Text(operation.farmName),
              ),
              ListTile(
                title: Text('Hectares'),
                subtitle: Text('${operation.hectares}'),
              ),
              ListTile(
                title: Text('Talhão'),
                subtitle: Text(operation.plot),
              ),
              ListTile(
                title: Text('Cultura Plantada'),
                subtitle: Text(operation.crop),
              ),
              ListTile(
                title: Text('Operação a Ser Realizada'),
                subtitle: Text(operation.operationType),
              ),
              ListTile(
                title: Text('Frente de trabalho'),
                subtitle: Text(operation.frenteTrabalho),
              ),
              ListTile(
                title: Text('Produtos'),
                subtitle: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: operation.products.entries
                          .map((entry) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('${entry.key}: ${entry.value}'),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                      'Quantidade:  ${entry.value * operation.hectares}'),
                                ],
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Data de Abertura de Ordem'),
                subtitle: Text(DateFormat('dd/MM/yyyy')
                    .format(operation.orderOpeningDate)),
              ),
              ListTile(
                title: Text('Data para Aplicação'),
                subtitle: Text(
                    DateFormat('dd/MM/yyyy').format(operation.applicationDate)),
              ),
              ListTile(
                title: Text('Data de Execução'),
                subtitle: Text(
                    DateFormat('dd/MM/yyyy').format(operation.executionDate)),
              ),
              ListTile(
                title: Text('Status Operacional'),
                subtitle: Text(operation.operationalStatus),
              ),
              ListTile(
                title: Text('Data de Planejamento'),
                subtitle: Text(
                    DateFormat('dd/MM/yyyy').format(operation.planningDate)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
