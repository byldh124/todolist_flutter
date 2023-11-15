import 'package:flutter/material.dart';
import 'package:todolist_flutter/data/db/memo_database.dart';
import 'package:todolist_flutter/data/model/memo_dao.dart';
import 'package:todolist_flutter/data/model/memo_entity.dart';

import '../common/Constants.dart';

class DetailScreen extends StatefulWidget {
  int id = 0;

  DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late MemoDao memoDao;
  late Memo memo;

  @override
  void initState() {
    super.initState();
    initFloor();
  }

  Future initFloor() async {
    final database = await $FloorMemoDatabase
        .databaseBuilder(Constants.databaseName)
        .build();
    memoDao = database.memoDao;
  }

  saveMemo(Memo memo) async {
    await memoDao.insertMemo(memo);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        centerTitle: false,
        title: Text(
          '메모',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Text(
              '저장',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
