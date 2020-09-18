import 'package:flutter/material.dart';
import 'package:my_scores_list/config/routes.dart';
import 'package:my_scores_list/main.dart';
import 'add_screen.dart';

bool isEdit = false;
int editIndex;

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
      onGenerateRoute: _registerRouteWithParameters,
    );
  }
}

class _ShowScreenState extends State<ShowScreen> {
  @override
  void initState() {
    super.initState();
  }

  int findNextOneIndex() {
    var leastNext = 0;
    var leastNextIndex;

    for (var i = 0; i < scores.length; i++) {
      if (leastNext == 0) {
        if (scores[i] >= scores[widget.index] && i != widget.index) {
          leastNext = scores[i];
          leastNextIndex = i;
        }
      } else {
        if (scores[i] > scores[widget.index] && i != widget.index) {
          if (scores[i] <= leastNext) {
            leastNext = scores[i];
            leastNextIndex = i;
          }
        }
      }
    }

    if (leastNextIndex == null) leastNextIndex = widget.index;

    return leastNextIndex;
  }

  bool isLastOne() {
    if (findNextOneIndex() == widget.index) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Data - " + names[widget.index]),
      ),
      body: Column(children: [
        Stack(children: [
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
              alignment: Alignment.topRight,
              child: MaterialButton(
                onPressed: () => {
                  isEdit = true,
                  editIndex = widget.index,
                  myControllerTextName.text = names[widget.index],
                  textScore = scores[widget.index].toString(),
                  Navigator.of(context).pushNamed(AppRoutes.pageAddData,
                      arguments: AddParameters("Edit Data")),
                },
                color: Colors.black,
                textColor: Colors.white,
                child: Icon(
                  Icons.edit,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              )),
        ]),
        Container(
          alignment: Alignment.bottomCenter,
          height: MediaQuery.of(context).size.height - 450,
          child: Text(
            "Next Person >",
            style: TextStyle(fontSize: 50),
          ),
        ),
        Container(
          child: Text(
            """
            
            """,
          ),
        ),
        Visibility(
            visible: !isLastOne(),
            child: Container(
              child: ListTile(
                onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.pageShowData,
                    arguments: ShowParameters(findNextOneIndex())),
                leading: Text((findNextOneIndex() + 1).toString(),
                    style: TextStyle(fontSize: 30)),
                title: Text(
                  names[findNextOneIndex()],
                  style: TextStyle(fontSize: 30),
                ),
                trailing: Text(
                  scores[findNextOneIndex()].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                  ),
                ),
              ),
            )),
        Visibility(
          visible: isLastOne(),
          child: Text(
            "... No one is next ...",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Visibility(
          visible: isLastOne(),
          child: Text(
            "You're the BEST!!!",
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        )
      ]),
    );
  }
}

Route _registerRouteWithParameters(RouteSettings settings) {
  if (settings.name == AppRoutes.pageAddData) {
    return MaterialPageRoute(builder: (context) {
      AddParameters parameter = settings.arguments;
      return AddScreen(title: parameter.title);
    });
  }
}
