import 'package:flutter/material.dart';

import '../data/model/memo_entity.dart';

class MemoWidget extends StatelessWidget {
  Memo memo;

  MemoWidget({
    super.key,
    required this.memo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Color(memo.color)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${memo.id}'),
              Text('${memo.date}'),
            ],
          ),
          Text(memo.desc),
        ],
      ),
    );
  }
}
