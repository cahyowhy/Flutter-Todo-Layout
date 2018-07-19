import 'package:flutter/material.dart';
import 'todo_datas.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoState createState() => new _TodoState();
}

class _TodoState extends State<TodoScreen> {
  List<Todo> _todos = new List();
  final textEditingController = TextEditingController();
  final textEditingFocusNode = FocusNode();
  final listviewScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _todos = todos;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    textEditingFocusNode.dispose();
    super.dispose();
  }

  _addTodos({text: String}) {
    setState(() {
      _todos.add(new Todo(text));
    });
  }

  _removeTodos(index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  Widget generateListItem(Todo todo, index) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description),
      leading: Icon(Icons.book, color: Colors.redAccent),
      trailing: IconButton(
          splashColor: Colors.redAccent,
          icon: Icon(Icons.check_circle),
          onPressed: () => _removeTodos(index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TODO')),
        body: Container(
          child: Column(children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                    padding:
                        EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                    child: ListView(
                      controller: listviewScrollController,
                      children: List.generate(_todos.length, (index) {
                        return generateListItem(_todos[index], index);
                      }),
                    ))),
            Expanded(
                flex: 0,
                child: Material(
                    color: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 5.0,
                    child: Container(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                              controller: textEditingController,
                              focusNode: textEditingFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: 'Fill with your email address',
                                  labelText: 'Email'),
                            ),
                          ),
                          Flexible(
                              flex: 0,
                              child: RaisedButton(
                                  child: Text('CEK'),
                                  color: Colors.blueAccent,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    _addTodos(text: textEditingController.text);
                                    textEditingController.clear();
                                    textEditingFocusNode.unfocus();
                                    listviewScrollController.animateTo(
                                        listviewScrollController
                                            .position.maxScrollExtent,
                                        curve: Curves.easeOut,
                                        duration: Duration(milliseconds: 1000));
                                  }))
                        ]))))
          ]),
        ));
  }
}
