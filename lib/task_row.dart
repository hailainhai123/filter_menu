import 'package:filter_menu/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskRow extends StatefulWidget {
  final Task task;
  final double dotSize = 12.0;
  final Animation<double> animation;

  const TaskRow({Key key, this.task, this.animation}) : super(key: key);

  @override
  _TaskRowState createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: widget.animation,
      child: SizeTransition(
        sizeFactor: widget.animation,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0 - widget.dotSize / 2),
                child: Container(
                  width: widget.dotSize,
                  height: widget.dotSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.task.color,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.name,
                      style: new TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      widget.task.category,
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Text(
                  widget.task.time,
                  style: new TextStyle(fontSize: 12.0, color: Colors.grey,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

