import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todolist_flutter/common/Constants.dart';
import 'package:todolist_flutter/data/db/memo_database.dart';
import 'package:todolist_flutter/data/model/memo_dao.dart';
import 'package:todolist_flutter/data/model/memo_entity.dart';
import 'package:todolist_flutter/screens/detail_screen.dart';
import 'package:todolist_flutter/widget/memo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MemoDao memoDao;
  List<Memo> memoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFloor();
  }

  Future initFloor() async {
    final database = await $FloorMemoDatabase
        .databaseBuilder(Constants.databaseName)
        .build();
    memoDao = database.memoDao;
    getMemoList();
  }

  void getMemoList() async {
    memoList = await memoDao.getAllMemos();
    setState(() {});
  }

  void addItem() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(memoDao: memoDao, id: -1),
      ),
    ).then((value) {
      getMemoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        shadowColor: Colors.red,
        centerTitle: false,
        elevation: 1,
        title: Text('메모장', style: Theme.of(context).textTheme.displayMedium),
        actions: [
          IconButton(
            onPressed: addItem,
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: ListView.builder(
              itemBuilder: (context, index) {
                final memo = memoList[index];
                return MemoWidget(
                  memoDao: memoDao,
                  memo: memo,
                  callback: getMemoList,
                );
              },
              itemCount: memoList.length)),
    );
  }
}
