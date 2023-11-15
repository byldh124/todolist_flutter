import 'package:flutter/material.dart';
import 'package:todolist_flutter/data/model/memo_dao.dart';
import 'package:todolist_flutter/screens/detail_screen.dart';

import '../data/model/memo_entity.dart';

class MemoWidget extends StatelessWidget {
  Memo memo;
  MemoDao memoDao;

  MemoWidget({
    super.key,
    required this.memoDao,
    required this.memo,
  });

  String getTimeFormat() {
     var dt = DateTime.fromMillisecondsSinceEpoch(memo.date);
     return "${dt.year} ${dt.month} ${dt.day}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(memoDao: memoDao, id: memo.id ?? -1),));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(memo.color)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(getTimeFormat()),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(memo.desc),
            ],
          ),
        ),
      ),
    );
  }
}
