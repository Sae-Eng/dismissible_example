import 'package:flutter/material.dart';

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({Key? key}) : super(key: key);

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  // 表示するリストアイテムを作成
  List<int> items = List<int>.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            // background: 第1背景
            // ・backgroundのみ指定 → 両スワイプ時の背景
            // ・secondaryBackgroundも指定 → 右スワイプ時の背景
            background: Container(
              color: Colors.greenAccent,
              child: const Align(
                  alignment: Alignment.centerLeft, child: Icon(Icons.check)),
            ),

            // secondaryBackground: 第2背景
            // ・左スワイプ時の背景
            secondaryBackground: Container(
              color: Colors.red,
              child: const Align(
                  alignment: Alignment.centerRight, child: Icon(Icons.delete)),
            ),

            // onDismissed: ウィジェットが閉じられたときに呼び出される
            onDismissed: (DismissDirection direction) {
              // DismissDirection.startToEnd → 右スワイプ背景
              if (direction == DismissDirection.startToEnd) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('COMPLETE!')));
              }

              // DismissDirection.endToStart → 左スワイプ背景
              if (direction == DismissDirection.endToStart) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('DELETE!')));
              }

              setState(() {
                items.removeAt(index);
              });
            },

            // key: 表示するリストアイテムにキーを付与し、正常にアイテムが置き換わるようにする
            key: ValueKey<int>(items[index]),

            // child: 表示するリストアイテム
            child: ListTile(
              title: Text('Item ${items[index]}'),
            ),
          );
        },
      ),
    );
  }
}
