import 'package:floor/floor.dart';

@entity
class Memo {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String desc;
  final int date;
  final int color;

  Memo({ this.id,
    required this.desc,
    required this.date,
    required this.color,
  });
}
