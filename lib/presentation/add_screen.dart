import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Page"),
        ),
        body: Center(
          child: Column(
            children: [
              Row(children: [
                Container(
                  width: 160,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.topRight,
                  child: Text("Name"),
                ),
                Container(
                  width: 100.0,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Enter a name'),
                        textAlign: TextAlign.center,
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
