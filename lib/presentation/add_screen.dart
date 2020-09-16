import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class AddScreen extends StatelessWidget {
  String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: TextField(
                  onSubmitted: (text) {
                    print(text);
                  },
                ),
              ),
              Container(
                  child: NumericKeyboard(
                      onKeyboardTap: _onKeyboardTap,
                      textColor: Colors.red,
                      rightButtonFn: () {
                        text = text.substring(0, text.length - 1);
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
    text = text + value;
  }
}
