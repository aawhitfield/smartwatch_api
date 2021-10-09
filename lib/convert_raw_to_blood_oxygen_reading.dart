part of 'smartwatch_api.dart';
// this function will take a list of int and convert it into the bloodOxygenReading
// model class
// values come as values IN HEX so when they are converted to decimal they are
// wrong and need to be converted BACK to hex -- except the actual reading itself

BloodOxygenReading convertRawToBloodOxygenReading(List<int> rawReading) {
  // get date
  int year = convertToHex(rawReading[SmartWatchAPI.watchYear]) + 2000; // reading comes as YY
  int month = convertToHex(rawReading[SmartWatchAPI.watchMonth]);
  int day = convertToHex(rawReading[SmartWatchAPI.watchDay]);
  int hour = convertToHex(rawReading[SmartWatchAPI.watchHour]);
  int min = convertToHex(rawReading[SmartWatchAPI.watchMin]);
  int sec = convertToHex(rawReading[SmartWatchAPI.watchSec]);

  DateTime date = DateTime(year, month, day, hour, min, sec);
  int id = date.millisecondsSinceEpoch;
  int value = rawReading[SmartWatchAPI.watchLatestOxygenIndex];

  return BloodOxygenReading(date: date, id: id, value: value);
}