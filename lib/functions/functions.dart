
import 'package:intl/intl.dart';

String getCurrentTime() {
  var now = DateTime.now();
  var formatter = DateFormat('HH:mm:ss');
  return formatter.format(now);
}

