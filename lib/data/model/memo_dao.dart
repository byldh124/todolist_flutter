// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:todolist_flutter/data/model/memo_entity.dart';

@dao
abstract class MemoDao {
  @insert
  Future<void> insertMemo(Memo memo);

  @Query('SELECT * FROM Memo ORDER by date desc')
  Future<List<Memo>> getAllMemos();

  @update
  Future<void> updateTask(Memo memo);

  @Query('SELECT * FROM Memo WHERE id = :id')
  Stream<Memo?> getMemoById(int id);

  @delete
  Future<void> deleteMemo(Memo memo);
}
