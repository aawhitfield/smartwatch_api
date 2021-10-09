part of 'smartwatch_api.dart';


// this function will take a list of int and convert it into the SleepReading
// model class
// values come as values IN HEX so when they are converted to decimal they are
// wrong and need to be converted BACK to hex -- except the actual reading itself



SleepReading convertRawToSleepReading(List<int> rawReading) {
  // get date

  int year = convertToHex(rawReading[SmartWatchAPI.watchYear]) + 2000; // reading comes as YY
  int month = convertToHex(rawReading[SmartWatchAPI.watchMonth]);
  int day = convertToHex(rawReading[SmartWatchAPI.watchDay]);
  int hour = convertToHex(rawReading[SmartWatchAPI.watchHour]);
  int min = convertToHex(rawReading[SmartWatchAPI.watchMin]);
  int sec = convertToHex(rawReading[SmartWatchAPI.watchSec]);

  DateTime date = DateTime(year, month, day, hour, min, sec);
  int id = date.millisecondsSinceEpoch;

  // const int deepLow = 0;
  const int deepHigh = 3;
  // const int lightLow = 4;
  const int lightHigh = 8;
  // const int remLow = 9;
  const int remHigh = 20;
  // const int awakeLow = 21;

  int deep = 0;
  int light = 0;
  int rem = 0;
  int awake = 0;

  // going to iterate over all the reading values
  // the readings start 2 values past the seconds position (the next one is the total reading length
  // count how many of which sleep types there are
  for(int i = SmartWatchAPI.watchSec + 2; i < rawReading.length; i++) {
    if(rawReading[i] <= deepHigh) {
      deep++;
    } else if(rawReading[i] <= lightHigh) {
      light++;
    } else if(rawReading[i] <= remHigh) {
      rem++;
    } else {
      awake++;
    }
  }

  int totalSleep = (deep + light + rem + awake) * 5;

  return SleepReading(
    date: date, id: id,
    value: totalSleep,
    details: SleepDetails(
      deep: deep, light: light, rem: rem, awake: awake,
    ),
  );
}
