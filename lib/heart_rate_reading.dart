part of 'smartwatch_api.dart';

// store information and data relating to a single heart rate reading


class HeartRateReading {
  @required DateTime? date;
  @required int? id;
  @required int? value;



  HeartRateReading({
    this.date,
    this.id,
    this.value,
  });

  Map<String, dynamic> toJson() =>
      {
        'date': date,
        'id' : id,
        'value' : value,
      };

}