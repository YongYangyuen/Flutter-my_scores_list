import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String text = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Add Page"),
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
                    decoration: InputDecoration(hintText: 'Enter a name'),
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
                    controller: TextEditingController(text: text),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  child: NumericKeyboard(
                      onKeyboardTap: _onKeyboardTap,
                      textColor: Colors.red,
                      rightButtonFn: () {
                        setState(() {
                          text = text.substring(0, text.length - 1);
                        });
                      },
                      rightIcon: Icon(
                        Icons.backspace,
                        color: Colors.red,
                      ),
                      leftButtonFn: () {
                        print('left button clicked');
                      },
                      leftIcon: Icon(
                        Icons.check,
                        color: Colors.red,
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly)),
            ],
          ),
        ));
  }

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }
}
