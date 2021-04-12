import 'package:intl/intl.dart';

class MyFormat {
  static formatDateTimeToYMDHMSString(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss')
        .format(dateTime);
  }
}