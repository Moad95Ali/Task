import 'package:intl/intl.dart';
import 'package:taskf/model/character.dart';

class FixTime {
  static String fixTime(String created) {
    final dt = DateTime.parse(created);
    return DateFormat.yMMM().format(dt);
  }
}
