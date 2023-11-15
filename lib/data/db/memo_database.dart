// database.dart

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:todolist_flutter/data/model/memo_dao.dart';
import 'package:todolist_flutter/data/model/memo_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'memo_database.g.dart';

@Database(version: 1, entities: [Memo])
abstract class MemoDatabase extends FloorDatabase {
  MemoDao get memoDao;
}
