import 'package:flutter/material.dart';
import 'package:my_scores_list/config/routes.dart';
import 'package:my_scores_list/main.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.home: (context) => MyHomePage(),
      },
    );
  }
}

class _AddScreenState extends State<AddScreen> {
  String textName = '';
  String textScore = '';

  @override
  void initState() {
    super.initState();
  }

  MyHomePage _myHomePage = new MyHomePage();

  final myControllerTextName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Add Data"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(children: [
                Container(
                  width: 120,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.topRight,
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  width: 200.0,
                  child: TextField(
                    controller: myControllerTextName,
                    decoration: InputDecoration(hintText: 'Enter name'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ]),
              Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: TextField(
                    enabled: false,
                    controller: TextEditingController(text: textScore),
                    decoration: InputDecoration(hintText: 'Enter score'),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  child: NumericKeyboard(
                      onKeyboardTap: _onKeyboardTap,
                      textColor: Colors.black,
                      rightButtonFn: () {
                        setState(() {
                          textScore =
                              textScore.substring(0, textScore.length - 1);
                        });
                      },
                      rightIcon: Icon(
                        Icons.backspace,
                        color: Colors.red,
                      ),
                      leftButtonFn: () {
                        print('left button clicked');
                        print(myControllerTextName.text);
                        print(textScore);
                        _myHomePage.updateData(
                            myControllerTextName.text, int.parse(textScore));
                        Navigator.of(context).pushNamed(AppRoutes.home);
                      },
                      leftIcon: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly)),
            ],
          ),
        ));
  }

  _onKeyboardTap(String value) {
    setState(() {
      textScore = textScore + value;
    });
  }
}
