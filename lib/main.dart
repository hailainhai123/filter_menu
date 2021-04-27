import 'package:filter_menu/animated_fab.dart';
import 'package:filter_menu/dialogonal_clipper.dart';
import 'package:filter_menu/list_model.dart';
import 'package:filter_menu/task.dart';
import 'package:filter_menu/task_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<AnimatedListState>();
  final double _imageHeight = 256.0;
  ListModel listModel;
  bool showOnlyCompleted = false;

  List<Task> tasks = [
    new Task(
        name: "Catch up with Brian",
        category: "Mobile Project",
        time: "5pm",
        color: Colors.orange,
        completed: false),
    new Task(
        name: "Make new icons",
        category: "Web App",
        time: "3pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Make new icons",
        category: "Web App",
        time: "3pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Make new icons",
        category: "Web App",
        time: "3pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Design explorations",
        category: "Company Website",
        time: "2pm",
        color: Colors.pink,
        completed: false),
    new Task(
        name: "Lunch with Mary",
        category: "Grill House",
        time: "12pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Lunch with Mary",
        category: "Grill House",
        time: "12pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Lunch with Mary",
        category: "Grill House",
        time: "12pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Lunch with Mary",
        category: "Grill House",
        time: "12pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Lunch with Mary",
        category: "Grill House",
        time: "12pm",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
    new Task(
        name: "Teem Meeting",
        category: "Hangouts",
        time: "10am",
        color: Colors.cyan,
        completed: true),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listModel = new ListModel(_listKey, tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildTimeLine(),
          _buildImage(),
          _buildTopHeader(),
          _buildProfileRow(),
          _buildBottomPart(),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipPath(
      clipper: new DialogonalClipper(),
      child: Container(
        width: double.infinity,
        child: new Image.asset(
          'assets/birds.jpg',
          fit: BoxFit.fitWidth,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          color: new Color.fromARGB(120, 20, 10, 40),
        ),
      ),
    );
  }

  Widget _buildTopHeader() {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        children: [
          Icon(
            Icons.menu,
            size: 32.0,
            color: Colors.white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "TimeLine",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Icon(
            Icons.linear_scale,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return Padding(
      padding: new EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
      child: Row(
        children: [
          CircleAvatar(
            minRadius: 28.0,
            maxRadius: 28.0,
            backgroundImage: AssetImage('assets/avatar.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Quang Hai',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Product Design',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart(){
    return Padding(
      padding: EdgeInsets.only(top: _imageHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMyTasksHeader(),
          _buildTasksList(),
        ],
      ),
    );
  }

  Widget _buildMyTasksHeader(){
    return Padding(
      padding: EdgeInsets.only(left: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Tasks',
            style: new TextStyle(fontSize: 34.0,),
          ),
          Text(
            'Apirl',
            style: new TextStyle(fontSize: 12.0, color: Colors.grey,),
          ),
        ],
      ),
    );
  }

  Widget _buildTasksList(){
    return Expanded(
      child: AnimatedList(
        initialItemCount: tasks.length,
        key: _listKey,
        itemBuilder: (context, index, animation) {
          return TaskRow(
            task: listModel[index],
            animation: animation,
          );
        },
      ),
    );
  }

  Widget _buildTimeLine(){
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }

  Widget _buildFab(){
    return Positioned(
      top: _imageHeight - 100.0,
      right: -40.0,
      child: AnimatedFab(
        onClick: _changeFilterState,
      ),
    );
  }

  void _changeFilterState(){
    showOnlyCompleted != showOnlyCompleted;
    tasks.where((task) => !task.completed).forEach((task) {
      if (showOnlyCompleted){
        listModel.removeAt(listModel.indexOf(task));
      } else {
        listModel.insert(tasks.indexOf(task), task);
      }
    });
  }

}
