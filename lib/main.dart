import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ListDisplay(),
    );
  }
}

class ListDisplay extends StatefulWidget {
  @override
  State createState() => new Ld();
}

class Ld extends State<ListDisplay> {
  /*List<String> listItems = [
    "Omar",
    "Oliver",
    "Mathias",
    "Talia",
    "Konrad",
    "Anders"
  ];*/
  List<String> listItems = [];
  final TextEditingController ectrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: new AppBar(
        title: new Text("List View"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: new Column(
          children: <Widget>[
            new TextFormField(
              controller: ectrl,
              decoration: new InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                hintText: "Tilføj til listen",
              ),

              //Handler tager en funktion og returner text
              onFieldSubmitted: (text) {
                listItems.add(text);
                ectrl.clear();
                setState(() {});
              },
            ),

            new Expanded(

              child: new ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(listItems[index]),
                    background: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        listItems.removeAt(index);
                      });
                    },
                    direction: DismissDirection.endToStart,
                    child: ListTile(
                      title: Text(listItems[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
