import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:todolist_flutter/common/Constants.dart';
import 'package:todolist_flutter/data/model/memo_dao.dart';
import 'package:todolist_flutter/data/model/memo_entity.dart';

class DetailScreen extends StatefulWidget {
  final MemoDao memoDao;
  final int id;

  const DetailScreen({super.key, required this.memoDao, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Memo memo = Memo(desc: "", date: 0, color: MyColor.yellow);
  bool doneSave = false;

  @override
  void initState() {
    super.initState();
    if (widget.id != -1) {
      getMemo();
    }
  }

  void getMemo() async {
    memo = await widget.memoDao.getMemoById(widget.id) ??
        Memo(desc: "", date: 0, color: MyColor.yellow);
    setState(() {});
  }

  void saveMemo() async {
    memo.date = DateTime.now().millisecondsSinceEpoch;
    await widget.memoDao.insertMemo(memo);
    Navigator.pop(context);
  }

  void updateMemo() async {
    memo.date = DateTime.now().millisecondsSinceEpoch;
    await widget.memoDao.updateMemo(memo);
    Navigator.pop(context);
  }

  void changeColor(int color) {
    setState(() {
      memo.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.red,
        centerTitle: false,
        elevation: 1,
        title: Text(
          '메모',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          GestureDetector(
            onTap: memo.id != null ? updateMemo : saveMemo ,
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
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(memo.color)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (text) {
                    memo.desc = text;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: TextEditingController(text: memo.desc),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ColorBox(
                  color: MyColor.yellow,
                  callback: (color) {
                    changeColor(color);
                  },
                ),
                ColorBox(
                  color: MyColor.violet,
                  callback: (color) {
                    changeColor(color);
                  },
                ),
                ColorBox(
                  color: MyColor.blue,
                  callback: (color) {
                    changeColor(color);
                  },
                ),
                ColorBox(
                  color: MyColor.green,
                  callback: (color) {
                    changeColor(color);
                  },
                ),
                ColorBox(
                  color: MyColor.pink,
                  callback: (color) {
                    changeColor(color);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  final int color;
  final void Function(int) callback;

  const ColorBox({super.key, required this.color, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback(color);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Color(color), borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
