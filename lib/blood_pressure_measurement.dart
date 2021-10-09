// To parse this JSON data, do
//
//     final bloodPressureMeasurement = bloodPressureMeasurementFromMap(jsonString);

import 'dart:convert';

class BloodPressureReading {
  BloodPressureReading({
    required this.date,
    required this.id,
    required this.value,
  });

  final DateTime date;
  final int id;
  final BloodPressureValue value;

  Map<String, dynamic> toJson() => {
    "date": date,
    "id": id,
    "value": value.toMap(),
  };

  Map<String, dynamic> toMap() => {
    "date": date,
    "id": id,
    "value": value.toMap(),
  };
}

class BloodPressureValue {
  BloodPressureValue({
    required this.diastolic,
    required this.systolic,
    required this.updated,
  });

  final int diastolic;
  final int systolic;
  final DateTime updated;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "diastolic": diastolic,
    "systolic": systolic,
    "updated": updated,
  };
}
