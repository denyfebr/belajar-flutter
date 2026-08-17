

import 'package:intl/intl.dart';

class MyNumberFormat {
  static String rupiah(int number){
    final currency = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
    return currency.format(number);
  }
}