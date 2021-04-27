import 'package:filter_menu/task.dart';
import 'package:filter_menu/task_row.dart';
import 'package:flutter/cupertino.dart';

class ListModel {
  ListModel(this.listKey, items) : this.items = new List.of(items);

  final GlobalKey<AnimatedListState> listKey;
  final List<Task> items;

  AnimatedListState get _animatedList => listKey.currentState;

  void insert(int index, Task item) {
    items.insert(index, item);
    _animatedList.insertItem(index,
        duration: Duration(
          milliseconds: 150,
        ));
  }

  Task removeAt(int index) {
    final Task removedItem = items.removeAt(index);
    if (removedItem != null) {
      _animatedList.removeItem(
        index,
        (context, animation) => new TaskRow(
          task: removedItem,
          animation: animation,
        ),
        duration: Duration(milliseconds: (150 + 150*(index/length)).toInt()),
      );
    }
    return removedItem;
  }

  int get length => items.length;

  Task operator [](int index) => items[index];

  int indexOf(Task item) => items.indexOf(item);
}
