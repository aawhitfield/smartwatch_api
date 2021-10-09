// this will take a raw reading from the smart watch, and as per the API documentation
// convert the last 2 values into hexadecimal, swap their order, and convert it back to decimal
// if the resultant temperature is under 50, we will assume Celsius measurements
// were used and convert that to Fahrenheit

import 'convert.dart';

double convertReturnedWatchTempToValue(List<int> rawReading) {

  int lastValue = rawReading[rawReading.length - 1];
  int secondToLastValue = rawReading[rawReading.length - 2];

  // converting int representations back to hex
  // e.g., [107, 1] ->  [6B, 1]
  String firstNumberAfterSwappingAsHex = lastValue.toRadixString(16);
  String secondNumberAfterSwappingAsHex = secondToLastValue.toRadixString(16);

  // swapping the order to make a 3-digit hex number
  // e.g., 16B
  String hexReading = firstNumberAfterSwappingAsHex + secondNumberAfterSwappingAsHex;

  // converting that 3-digit hex number back to int
  // e.g., 363
  int wholeNumber = int.parse(hexReading, radix: 16);

  // the last digit is the decimal place, so dividing by 10
  // e.g., 363 / 10 = 36.3
  double temperature = wholeNumber / 10;

  if(temperature < 50) {
    // assume body temperatures under 50 degrees must be Celsius so converting to
    // Fahrenheit
    // e.g., 36.3 -> 97.34
    temperature = convertCelsiusToFahrenheit(temperature);
  }

  temperature = roundDoubleToNPlaces(temperature, 1);
  return temperature;
}