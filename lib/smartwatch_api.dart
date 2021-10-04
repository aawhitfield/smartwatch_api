library smartwatch_api;


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

}
