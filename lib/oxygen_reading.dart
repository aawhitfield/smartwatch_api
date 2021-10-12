part of 'smartwatch_api.dart';

// store information and data relating to a single blood oxygen reading
// that comes from the bluetooth blood oxygen meter for sharing data
// between functions

class OxygenReading {
  @required
  int? pulse;
  @required
  int? oxygenSaturationLevel;
  @required
  DateTime? dateTime;

  OxygenReading({
    this.pulse,
    this.oxygenSaturationLevel,
    this.dateTime,
  });
}
