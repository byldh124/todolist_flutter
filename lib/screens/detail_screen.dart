import 'package:flutter/material.dart';
import 'package:todolist_flutter/data/db/memo_database.dart';
import 'package:todolist_flutter/data/model/memo_dao.dart';
import 'package:todolist_flutter/data/model/memo_entity.dart';

import '../common/Constants.dart';

class DetailScreen extends StatefulWidget {
  MemoDao memoDao;
  int id = -1;

  DetailScreen({super.key, required this.memoDao, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Memo memo;

  bool doneSave = false;

  @override
  void initState() {
    super.initState();
    //TODO id = -1인 경우는 신규 입력으로 판단하여 floor에서 데이터를 가져오지 말것
    print("DetailScreen initState");
  }

  saveMemo() async {
    memo.date = DateTime.now().millisecondsSinceEpoch;
    await widget.memoDao.insertMemo(memo);
    Navigator.pop(context);
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
            onTap: saveMemo,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Center(
                child: Text(
                  '저장',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          StreamBuilder(
            
            stream: widget.memoDao.getMemoById(widget.id),
            builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return Container(
                      decoration: BoxDecoration(color: Color(data.color)),
                      child: Text('Hello'),
                  );
                }
                return const CircularProgressIndicator();
            },
          ),

          Container(
            width: 100,
            decoration: BoxDecoration(color: Colors.red),
          )
        ],
      ),
    );
  }
}
