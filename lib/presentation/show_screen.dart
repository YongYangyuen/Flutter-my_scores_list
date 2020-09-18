import 'package:flutter/material.dart';
import 'package:my_scores_list/config/routes.dart';
import 'package:my_scores_list/main.dart';
import 'package:my_scores_list/presentation/add_screen.dart';

class ShowParameters {
  final int index;
  const ShowParameters(this.index);
}

class ShowScreen extends StatefulWidget {
  final int index;
  ShowScreen({this.index});

  @override
  _ShowScreenState createState() => _ShowScreenState();
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.pageAddData: (context) => AddScreen(),
      },
    );
  }
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Data - " + names[widget.index]),
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.center,
          height: 200,
          decoration: BoxDecoration(color: Colors.blue, border: Border.all()),
          child: ListTile(
            leading: Text((widget.index + 1).toString(),
                style: TextStyle(fontSize: 30)),
            title: Text(
              names[widget.index],
              style: TextStyle(fontSize: 30),
            ),
            trailing: Text(
              scores[widget.index].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 55,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height - 450,
          child: Text(
            "Next Person >",
            style: TextStyle(fontSize: 50),
          ),
        )
      ]),
    );
  }
}
