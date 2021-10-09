// this will take a raw reading from the smart watch, and as per the API documentation
// convert the indicated 4 values into hexadecimal, swap their order, and convert it back to decimal

int convertReturnedWatchStepsToValue(List<int> rawReading) {

  // following API documentation
  int s1 = rawReading[5];
  int s2 = rawReading[6];
  int s3 = rawReading[7];
  int s4 = rawReading[8];

  // converting int representations back to hex
  // e.g., [107, 1] ->  [6B, 1]
  String firstNumberAfterSwappingAsHex = s4.toRadixString(16);
  String secondNumberAfterSwappingAsHex = s3.toRadixString(16);
  String thirdNumberAfterSwappingAsHex = s2.toRadixString(16);
  String fourthNumberAfterSwappingAsHex = s1.toRadixString(16);

  // swapping the order to make a 3-digit hex number
  // e.g., 16B
  String hexReading = firstNumberAfterSwappingAsHex + secondNumberAfterSwappingAsHex
      + thirdNumberAfterSwappingAsHex + fourthNumberAfterSwappingAsHex;

  // converting that 3-digit hex number back to int
  // e.g., 363S
  int steps = int.parse(hexReading, radix: 16);

  return steps;
}