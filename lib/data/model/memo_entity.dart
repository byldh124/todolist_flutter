import 'package:floor/floor.dart';

@entity
class Memo {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  String desc;
  int date;
  int color;

  Memo({ this.id,
    required this.desc,
    required this.date,
    required this.color,
  });
}
