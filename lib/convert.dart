// this file will be used to convert between common units of measurement

double convertCelsiusToFahrenheit(double celsius) {
  return celsius * 9 / 5 + 32;
}

// this will take a double and round it to a requested number of decimal places
double roundDoubleToNPlaces(double long, int numberPlaces) {
  String temp = long.toStringAsFixed(numberPlaces);
  double rounded = double.parse(temp);

  return rounded;

}