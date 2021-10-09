library smartwatch_api;

import 'convert_to_hex.dart';
import 'package:smartwatch_api/blood_oxygen_reading.dart';
import 'blood_pressure_measurement.dart';
import 'hrv_reading.dart';
import 'body_temperature_reading.dart';
import 'convert_returned_watch_temp_to_value.dart';
import 'heart_rate_reading.dart';
import 'package:smartwatch_api/sleep_reading.dart';
import 'package:smartwatch_api/steps_reading.dart';
import 'convert_returned_watch_steps_to_value.dart';

part 'convert_raw_to_blood_oxygen_reading.dart';
part 'convert_raw_to_blood_pressure_reading.dart';
part 'convert_raw_to_body_temperature_reading.dart';
part 'convert_raw_to_heart_rate_reading.dart';
part 'convert_raw_to_sleep_reading.dart';
part 'convert_raw_to_steps_reading.dart';

enum Watch {
  v1,
  v2
}

enum ClockType {
  aMorPm,
  military
}

class SmartWatchAPI {

  static const String smartWatchNameV1 = '1963YH';
  static const String smartWatchNameV2 = '2025';

  static const List<int> heartRateHistoryData = [0x55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x55 + 0) & 0xff];
  static const List<int> eraseHeartRateHistoryData = [0x55, 0x99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x55 + 0x99) & 0xff];
  static const List<int> bloodPressureHistoryData = [0x56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x56 +0 & 0xff)];
  static const List<int> eraseBloodPressureHistoryData = [0x56, 0x99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x56 + 0x99) & 0xff];
  static const List<int> bloodOxygenHistoryData = [0x60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x60 +0 & 0xff)];
  static const List<int> eraseBloodOxygenHistoryData = [0x60, 0x99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x60 + 0x99) & 0xff];
  static const List<int> bodyTemperatureHistoryData = [0x62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x62 +0 & 0xff)];
  static const List<int> eraseBodyTemperatureHistoryData = [0x62, 0x99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x62 + 0x99) & 0xff];
  static const List<int> stepsHistoryData = [0x51, 0x00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x51 + 0) & 0xff];
  static const List<int> eraseStepsHistoryData = [0x51, 0x99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x51 + 0x99) & 0xff];
  static const List<int> sleepHistoryData = [0x53, 0x00, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x53 + 0) & 0xff];
  static const List<int> eraseSleepHistoryData = [0x53, 0x99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, (0x53 + 0x99) & 0xff];

  static const int heartRateHistoryCode = 85;
  static const int bloodPressureHistoryCode = 86;
  static const int bloodOxygenHistoryCode = 96;
  static const int bodyTemperatureHistoryCode = 98;
  static const int watchBatteryLevelCode = 19;
  static const int stepsHistoryCode = 81;
  static const int sleepHistoryCode = 83;
  static const int watchYear = 3;
  static const int watchMonth = 4;
  static const int watchDay = 5;
  static const int watchHour = 6;
  static const int watchMin = 7;
  static const int watchSec = 8;
  static const int heartReadingLength = 10;
  static const int bloodOxygenLength = 10;
  static const int bloodPressureLength = 15;
  static const int bodyTemperatureLength = 11;
  static const int watchBatteryLevelLength = 16;
  static const int stepsReadingLength = 27;
  static const int sleepReadingLength = 34;
  static const int watchHRV = 9;
  static const int watchLatestOxygenIndex = 9;


  // this function will take a list of 15 integers and computer the smart-watch
  // CRC bit and return it as an array
  static List<int> appendCRC(List<int> data) {
    List<int> crc = [0];

    // add all the values in the array
    int sum = data.fold(0, (previousValue, currentValue) => previousValue + currentValue);

    // calculate the checksum
    int checksum = sum & 0xff;

    // set the checksum to the array for combining
    crc[0] = checksum;

    data.addAll(crc);

    // return the new list with the checksum
    return data;

  }

  static List<int> setHeartRateMonitoringTime(int minutes, Watch watchType) {
    List<int> data = <int>[];
    if (watchType == Watch.v1) {
      data.addAll([0x2a, 2, 0, 0, 0x23, 0x59, 0x7f, minutes, 0, 0, 0, 0, 0, 0, 0,]);
    }
    else {
      data.addAll([0x2a, 2, 0, 0, 0x23, 0x59, 0x7f, 0x05, 0, 0, 0, 0, 0, 0, 0,]);
    }
    data = appendCRC(data);
    return data;
  }

  static List<int> setDeviceBasicParameters() {
    // set units as miles and Fahrenheit
    List<int> data = <int>[];
    data.addAll([0x03, 0x81, 0, 0, 0x81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    data = appendCRC(data);
    return data;
  }

  static List<int> getDeviceBatteryLevel() {
    List<int> data = <int>[];
    data.addAll([0x13, 0x99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    data = appendCRC(data);
    return data;
  }

  static List<int> setDeviceBrightness(double brightnessLevel) {
    int brightnessHex = 0x88;

    // get the hex code from the brightness slider
    if (brightnessLevel == 1.0) {
      brightnessHex = 0x80;
    } else if (brightnessLevel == 0.5) {
      brightnessHex = 0x88;
    } else if (brightnessLevel == 0) {
      brightnessHex = 0x8f;
    } else {
      brightnessHex = 0x88;
    }

    List<int> data = <int>[];
    data.addAll([0x03, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, brightnessHex, 0, 0, 0]);
    data = appendCRC(data);
    return data;
  }

  /// allows watch to toggle time format between 12H and 24H time
  static List<int> setDeviceTimeFormat(ClockType clockType) {
    int timeHex = 0x81;

    switch(clockType) {
      case ClockType.aMorPm : timeHex = 0x81; break;
      case ClockType.military : timeHex = 0x80; break;
    }

    List<int> data = <int>[];
    data.addAll([0x03, 0, timeHex, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
    data = appendCRC(data);
    return data;
  }
  // this function will take a number like 20, and return it as though it were IN
  // hexadecimal i.e., 0x20
  // this function does NOT convert the decimal representation 20 into the hex representation
  // or 0x14
  static int representValueAsHex(int num) {
    return int.parse('$num', radix: 16);
  }

  static List<int> setWatchDateTime() {
    List<int> data = List<int>.filled(15, 0, growable: true);
    data[0] = 0x01;   // command to set date/time on watch

    DateTime now = DateTime.now();

    // set the year
    int fourDigitYear = now.year;
    int twoDigitYear = fourDigitYear - 2000;
    data[1] = representValueAsHex(twoDigitYear);

    data[2] = representValueAsHex(now.month);
    data[3] = representValueAsHex(now.day);
    data[4] = representValueAsHex(now.hour);
    data[5] = representValueAsHex(now.minute);
    data[6] = representValueAsHex(now.second);

    // append the checksum bit onto the end
    data = appendCRC(data);
    return data;
  }


}
