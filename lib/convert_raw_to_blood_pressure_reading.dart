part of 'smartwatch_api.dart';
// this function will take a list of int and convert it into the bloodPressureReading
// model class
// values come as values IN HEX so when they are converted to decimal they are
// wrong and need to be converted BACK to hex -- except the actual reading itself



BloodPressureReading convertRawToBloodPressureReading(List<int> rawReading) {
  // get date

  int year = convertToHex(rawReading[SmartWatchAPI.watchYear]) + 2000; // reading comes as YY
  int month = convertToHex(rawReading[SmartWatchAPI.watchMonth]);
  int day = convertToHex(rawReading[SmartWatchAPI.watchDay]);
  int hour = convertToHex(rawReading[SmartWatchAPI.watchHour]);
  int min = convertToHex(rawReading[SmartWatchAPI.watchMin]);
  int sec = convertToHex(rawReading[SmartWatchAPI.watchSec]);

  DateTime date = DateTime(year, month, day, hour, min, sec);
  int id = date.millisecondsSinceEpoch;
  int systolic = rawReading[SmartWatchAPI.bloodPressureLength - 2];
  int diastolic = rawReading[SmartWatchAPI.bloodPressureLength - 1];

  return BloodPressureReading(date: date, id: id,
    value: BloodPressureValue(
      systolic: systolic, diastolic: diastolic, updated: date,
    ),
  );
}

// this will take a raw blood pressure reading, and strip away and return the HRV
// information

HrvReading convertRawToHrvReading(List<int> rawReading) {
  // get date

  int year = convertToHex(rawReading[SmartWatchAPI.watchYear]) + 2000; // reading comes as YY
  int month = convertToHex(rawReading[SmartWatchAPI.watchMonth]);
  int day = convertToHex(rawReading[SmartWatchAPI.watchDay]);
  int hour = convertToHex(rawReading[SmartWatchAPI.watchHour]);
  int min = convertToHex(rawReading[SmartWatchAPI.watchMin]);
  int sec = convertToHex(rawReading[SmartWatchAPI.watchSec]);

  DateTime date = DateTime(year, month, day, hour, min, sec);
  int id = date.millisecondsSinceEpoch;
  int hrv = rawReading[SmartWatchAPI.watchHRV];

  return HrvReading(date: date, id: id, value: hrv,);
}
