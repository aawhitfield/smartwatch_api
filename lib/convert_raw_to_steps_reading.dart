part of 'smartwatch_api.dart';

// this function will take a list of int and convert it into the stepsReading
// model class
// values come as values IN HEX so when they are converted to decimal they are
// wrong and need to be converted BACK to hex -- except the actual reading itself


StepsReading convertRawToStepsReading(List<int> rawReading) {
  int stepsYear = 2;
  int stepsMonth = 3;
  int stepsDay = 4;
  // get date

  int year = convertToHex(rawReading[stepsYear]) + 2000; // reading comes as YY
  int month = convertToHex(rawReading[stepsMonth]);
  int day = convertToHex(rawReading[stepsDay]);

  DateTime date = DateTime(year, month, day);
  int id = date.millisecondsSinceEpoch;
  int value = convertReturnedWatchStepsToValue(rawReading);

  return StepsReading(date: date, id: id, value: value);
}