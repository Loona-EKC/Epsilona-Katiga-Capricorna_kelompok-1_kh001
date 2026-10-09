class MedicineModel {
  final String id;
  final String name;
  final String type;
  final String dosage;
  final String usage;
  final String consumptionRule;
  final int frequency;
  final List<String> times;
  final int duration;
  final String startDate;
  final String endDate;
  final String expiryDate;
  final String? sideEffects;
  final bool isCompound;
  final List<String>? composition;
  final bool isActive;

  MedicineModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dosage,
    required this.usage,
    required this.consumptionRule,
    required this.frequency,
    required this.times,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.expiryDate,
    this.sideEffects,
    this.isCompound = false,
    this.composition,
    this.isActive = true,
  });
}
