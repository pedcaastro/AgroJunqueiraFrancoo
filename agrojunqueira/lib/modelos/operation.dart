class Operation {
  final String farmCode;
  final String farmName;
  final double hectares;
  final String plot;
  final String crop;
  final String operationType;
  final String frenteTrabalho;
  final Map<String, double> products; // Product name and dose
  final DateTime orderOpeningDate;
  final DateTime applicationDate;
  final DateTime executionDate;
  final String operationalStatus;
  final DateTime planningDate;
  final String prescriptionNumber;

  Operation({
    required this.farmCode,
    required this.farmName,
    required this.hectares,
    required this.plot,
    required this.crop,
    required this.operationType,
    required this.frenteTrabalho,
    required this.products,
    required this.orderOpeningDate,
    required this.applicationDate,
    required this.executionDate,
    required this.operationalStatus,
    required this.planningDate,
    required this.prescriptionNumber,
  });
}
