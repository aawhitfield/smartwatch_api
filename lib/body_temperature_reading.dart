import 'package:flutter/material.dart';

// store information and data relating to a single heart rate reading


class BodyTemperatureReading {
  @required DateTime? date;
  @required int? id;
  @required double? value;



  BodyTemperatureReading({
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