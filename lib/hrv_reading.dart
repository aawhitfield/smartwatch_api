part of 'smartwatch_api.dart';

// store information and data relating to a single blood oxygen reading


class HrvReading {
  @required DateTime? date;
  @required int? id;
  @required int? value;



  HrvReading({
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