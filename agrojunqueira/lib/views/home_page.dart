import 'package:agrojunqueira/views/add_edit_operation_page.dart';
import 'package:flutter/material.dart';

import '../modelos/operation.dart';
import '../widgets/operation_list_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista temporária para simular armazenamento de dados em memória.
  List<Operation> operations = [];

  void _navigateToAddOperation() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => AddEditOperationPage(onSubmit: _addOperation)),
    );
  }

  void _addOperation(Operation operation) {
    setState(() {
      operations.add(operation);
    });
  }

  void _updateOperation(Operation updatedOperation) {
    setState(() {
      // Encontre a operação na lista e atualize-a
      final index = operations
          .indexWhere((op) => op.farmCode == updatedOperation.farmCode);
      if (index != -1) {
        operations[index] = updatedOperation;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Controle de Operações Agrícolas'),
      ),
      body: operations.isEmpty
          ? Center(
              child: Text('Nenhuma operação cadastrada.'),
            )
          : ListView.builder(
              itemCount: operations.length,
              itemBuilder: (context, index) {
                return OperationListItem(operation: operations[index]);
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        elevation: 10,
        child: Icon(Icons.add),
        onPressed: _navigateToAddOperation,
        hoverColor: Colors.white38,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
