class Calculation {
  // TODO automaten zeichnen
  // TODO private machen
  String calculation = '';
  void append(int digit) {
    calculation += digit.toString();
  }
  void remove() {
    calculation = calculation.substring(0, calculation.length - 1);
  }

}

enum CalculationState {
  PLUSMINUS, FLOAT, INTEGER, MULDIV,
}