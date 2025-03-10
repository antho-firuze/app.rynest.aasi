extension DateTimeExtension on num {
  String toRomanNumberString() {
    const List<int> arabianRomanNumbers = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    const List<String> romanNumbers = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];

    if (this < 0) {
      return '';
    }
    if (this == 0) {
      return '0';
    }
    var num = this;
    final builder = StringBuffer();
    for (var a = 0; a < arabianRomanNumbers.length; a++) {
      final times = (num / arabianRomanNumbers[a]).truncate(); // equals 1 only when arabianRomanNumbers[a] = num
      // executes n times where n is the number of times you have to add
      // the current roman number value to reach current num.
      builder.write(romanNumbers[a] * times);
      num -= times * arabianRomanNumbers[a]; // subtract previous roman number value from num
    }

    return builder.toString();
  }
}
