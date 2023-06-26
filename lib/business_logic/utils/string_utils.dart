import 'package:intl/intl.dart';

class StringUtils {
  static bool isEmpty(String? s) => s == null || s.trim().isEmpty;
  static bool isNotEmpty(String? s) => !isEmpty(s);

  static String removeNonNumericCharacters(String value) {
    String regex =
        r'[^\p{Alphabetic}\p{Mark}\p{Decimal_Number}\p{Connector_Punctuation}\p{Join_Control}\s]+';
    String newValue = value.replaceAll(RegExp(regex, unicode: true), '');

    return newValue.replaceAll(' ', '');
  }

  static String convertDateToReadable(DateTime date) {
    final formatter = DateFormat('MM/dd/yy');
    return formatter.format(date);
  }
}
