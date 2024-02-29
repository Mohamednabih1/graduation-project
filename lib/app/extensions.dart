import 'constants/global_constants.dart';

extension Range on num {
  bool isBetween(num from, num to) {
    return from < this && this < to;
  }

  bool inRange(num from, num to) {
    return from <= this && this <= to;
  }
}

extension NonNullString on String? {
  String get orEmpty {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int get orMinusOne {
    if (this == null) {
      return Constants.minusOne;
    } else {
      return this!;
    }
  }
}

class Dec2Bin {
  /// Take a decimal number and convert it to a list of int contain just 0 or 1
  ///
  /// If the decimal number is negative or 0 an empty list will be returned
  ///
  /// Otherwise a list with modulus 8 length will be returned.
  List<int> dec2Bin(int decimal) {
    List<int> bin = [];
    if (decimal.isNegative || decimal == 0) {
      return List.filled(8, 0);
    } else {
      while (decimal > 0) {
        bin.add((decimal % 2));
        decimal = (decimal / 2).floor();
      }
      while ((bin.length % 8) != 0) {
        bin.add(0);
      }
      return bin.toList();
    }
  }

  /// Returns false if the number is 0.
  /// True otherwise.
  bool bin2Bool(int number) {
    if (number == 0) {
      return false;
    }
    return true;
  }

  int listOfBool2Dec(List<bool> listOfBool) {
    StringBuffer buffer = StringBuffer();
    buffer.writeAll(listOfBool.map((e) => e ? 1 : 0).toList().reversed);
    return (int.parse(buffer.toString(), radix: 2));
  }
}
