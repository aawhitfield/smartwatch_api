// this function will take a decimal number and convert it to an int of the same
// number in hexadecimal

int convertToHex(int decimal) {
  String hex = decimal.toRadixString(16);
  int converted = int.parse(hex);

  return converted;
}