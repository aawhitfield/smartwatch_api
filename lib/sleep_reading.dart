// To parse this JSON data, do
//
//     final bloodPressureMeasurement = bloodPressureMeasurementFromMap(jsonString);

import 'dart:convert';

class SleepReading {
  SleepReading({
    required this.date,
    required this.id,
    required this.value,
    required this.details
  });

  final DateTime date;
  final int id;
  final int value;
  final SleepDetails details;

  Map<String, dynamic> toJson() => {
    "date": date,
    "id": id,
    "value": value,
    'sleepDetails': details.toMap(),
  };

  Map<String, dynamic> toMap() => {
    "date": date,
    "id": id,
    "value": value,
    'sleepDetails': details.toMap(),
  };

  SleepReading operator +(SleepReading other) {
    // save which ever reading has the earlier date
    return SleepReading(date: (this.date.isBefore(other.date)) ? this.date : other.date, id: this.id, value: this.value + other.value, details: this.details + other.details);
  }
}

class SleepDetails {
  SleepDetails({
    required this.deep,
    required this.light,
    required this.rem,
    required this.awake
  });

  final int deep;
  final int light;
  final int rem;
  final int awake;

  factory SleepDetails.fromJson(String str) => SleepDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SleepDetails.fromMap(Map<String, dynamic> json) {

    return SleepDetails(
      deep: (json["deep"] as num).toInt(),
      light: (json["light"] as num).toInt(),
      rem: (json["rem"] as num).toInt(),
      awake: (json["awake"] as num).toInt()
    );
  }

  Map<String, dynamic> toMap() => {
    "deep": deep,
    "light": light,
    "rem": rem,
    "awake": awake,
  };

  SleepDetails operator +(SleepDetails other) {
    return SleepDetails(deep: this.deep + other.deep, light: this.light + other.light,
        rem: this.rem + other.rem,
        awake: this.awake + other.awake);
  }
}
