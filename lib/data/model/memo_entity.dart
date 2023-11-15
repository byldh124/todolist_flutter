import 'package:floor/floor.dart';

@entity
class Memo {
  @primaryKey
  final int id;
  final String desc;
  final int date;
  final int color;

  Memo({
    required this.id,
    required this.desc,
    required this.date,
    required this.color,
  });
}
