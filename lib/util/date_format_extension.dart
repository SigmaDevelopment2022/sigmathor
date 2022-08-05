import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String format() {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    return dateFormat.format(this);
  }
}
