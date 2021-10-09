// store information and data relating to a single steps reading


class StepsReading {
  final DateTime date;
  final int id;
  final int value;



  StepsReading({
    required this.date,
    required this.id,
    required this.value,
  });

  Map<String, dynamic> toJson() =>
      {
        'date': date,
        'id' : id,
        'value' : value,
      };

}