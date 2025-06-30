import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toFormattedString() => DateFormat("dd MMM yyyy").format(this);
}
