import 'package:flutter/material.dart';
import 'package:todolist_flutter/data/model/memo_dao.dart';
import 'package:todolist_flutter/screens/detail_screen.dart';

import '../data/model/memo_entity.dart';

class MemoWidget extends StatelessWidget {
  final Memo memo;
  final MemoDao memoDao;
  final void Function() callback;

  const MemoWidget({
    super.key,
    required this.memoDao,
    required this.memo,
    required this.callback,
  });

  String getTimeFormat() {
    var dt = DateTime.fromMillisecondsSinceEpoch(memo.date);
    return "${dt.year} ${dt.month} ${dt.day}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailScreen(memoDao: memoDao, id: memo.id ?? -1),
            )).then((value) {
              callback();
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), offset: Offset(2, 2))
        ], borderRadius: BorderRadius.circular(10), color: Color(memo.color)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(getTimeFormat()),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(memo.desc),
            ],
          ),
        ),
      ),
    );
  }
}
