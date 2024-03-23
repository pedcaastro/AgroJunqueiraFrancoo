import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:intl/intl.dart';

import '../modelos/operation.dart';

class AddEditOperationPage extends StatefulWidget {
  final Operation? operation;
  final Function(Operation) onSubmit;

  AddEditOperationPage({this.operation, required this.onSubmit});

  @override
  _AddEditOperationPageState createState() => _AddEditOperationPageState();
}

class _AddEditOperationPageState extends State<AddEditOperationPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _productControllers = {};
  final TextEditingController _farmCodeController = TextEditingController();
  final TextEditingController _farmNameController = TextEditingController();
  final TextEditingController _hectaresController = TextEditingController();
  final TextEditingController _plotController = TextEditingController();
  final TextEditingController _cropController = TextEditingController();
  final TextEditingController _operationTypeController =
      TextEditingController();
  final TextEditingController _prescriptionNumberController =
      TextEditingController();
  final TextEditingController _frenteController = TextEditingController();
  DateTime? _orderOpeningDate, _applicationDate, _executionDate, _planningDate;

  @override
  void initState() {
    super.initState();
    if (widget.operation != null) {
      // Initialize controllers and variables with operation data for editing
    }
  }

  void _addProduct() {
    TextEditingController productController = TextEditingController();
    TextEditingController doseController = TextEditingController();

    // Exibe um diálogo para o usuário inserir o nome do produto
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Produto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productController,
                decoration: InputDecoration(labelText: 'Nome do Produto'),
              ),
              TextField(
                controller: doseController,
                decoration: InputDecoration(labelText: 'Dose'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                if (productController.text.isNotEmpty &&
                    doseController.text.isNotEmpty) {
                  // Adiciona o controlador de dose ao mapa, usando o nome do produto como chave
                  setState(() {
                    _productControllers[productController.text] =
                        doseController;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildDatePicker(String label, DateTime? selectedDate,
      ValueChanged<DateTime?> onDateSelected) {
    return ListTile(
      title: Text(label),
      subtitle: Text(selectedDate != null
          ? DateFormat('dd/MM/yyyy').format(selectedDate)
          : 'Selecione uma data'),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null && picked != selectedDate) {
          onDateSelected(picked);
        }
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final Map<String, double> products = {};
      _productControllers.forEach((key, controller) {
        final dose = double.tryParse(controller.text);
        if (dose != null) {
          products[key] = dose;
        }
      });

      final newOperation = Operation(
        farmCode: _farmCodeController.text,
        farmName: _farmNameController.text,
        hectares: double.tryParse(_hectaresController.text) ?? 0,
        plot: _plotController.text,
        crop: _cropController.text,
        operationType: _operationTypeController.text,
        frenteTrabalho: _frenteController.text,
        products: products,
        orderOpeningDate: _orderOpeningDate!,
        applicationDate: _applicationDate!,
        executionDate: _executionDate!,
        operationalStatus: _selectedOperationalStatus.toString(),
        planningDate: _planningDate!,
        prescriptionNumber: _prescriptionNumberController.text,
      );
      widget.onSubmit(newOperation);
      Navigator.of(context).pop();
    }
  }

  String? _selectedOperationalStatus;
  final List<String> _operationalStatusOptions = [
    'Abrir',
    'Aberto',
    'Em andamento',
    'Finalizado'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.operation == null
            ? 'Adicionar Operação'
            : 'Editar Operação'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                    controller: _prescriptionNumberController,
                    decoration: InputDecoration(labelText: 'RA')),
                TextFormField(
                    controller: _farmCodeController,
                    decoration:
                        InputDecoration(labelText: 'Código da Fazenda')),
                TextFormField(
                    controller: _farmNameController,
                    decoration: InputDecoration(labelText: 'Nome da Fazenda')),
                TextFormField(
                    controller: _hectaresController,
                    decoration: InputDecoration(labelText: 'Hectares'),
                    keyboardType: TextInputType.number),
                TextFormField(
                    controller: _plotController,
                    decoration: InputDecoration(labelText: 'Talhão')),
                TextFormField(
                    controller: _cropController,
                    decoration: InputDecoration(labelText: 'Cultura Plantada')),
                TextFormField(
                    controller: _operationTypeController,
                    decoration:
                        InputDecoration(labelText: 'Operação a Ser Realizada')),
                TextFormField(
                    controller: _frenteController,
                    decoration: InputDecoration(labelText: 'Frente')),
                ..._productControllers.entries.map((entry) {
                  return TextFormField(
                    controller: entry.value,
                    decoration: InputDecoration(
                      labelText: "${entry.key}",
                    ),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a dose do produto';
                      }
                      return null;
                    },
                  );
                }).toList(),
                _buildDatePicker(
                  'Data de Abertura de Ordem',
                  _orderOpeningDate,
                  (newDate) => setState(() => _orderOpeningDate = newDate),
                ),
                _buildDatePicker(
                  'Data para Aplicação',
                  _applicationDate,
                  (newDate) => setState(() => _applicationDate = newDate),
                ),
                _buildDatePicker(
                  'Data de Execução',
                  _executionDate,
                  (newDate) => setState(() => _executionDate = newDate),
                ),
                _buildDatePicker(
                  'Data de Planejamento',
                  _planningDate,
                  (newDate) => setState(() => _planningDate = newDate),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedOperationalStatus,
                  decoration: InputDecoration(labelText: 'Status Operacional'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOperationalStatus = newValue!;
                    });
                  },
                  items: _operationalStatusOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: _submitForm, child: Text('Salvar Operação')),
                    ElevatedButton(
                      onPressed: _addProduct,
                      child: Text('Adicionar Produtos'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
