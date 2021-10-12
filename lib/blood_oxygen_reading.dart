part of 'smartwatch_api.dart';

// store information and data relating to a single blood oxygen reading


class BloodOxygenReading {
  @required DateTime? date;
  @required int? id;
  @required int? value;



  BloodOxygenReading({
    this.date,
    this.id,
    this.value,
  });

}