import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Buy cookies', 'completed': true},
    {'title': 'Star Riverpod', 'completed': false},
    {'title': 'Have a walk', 'completed': false},
  ];

  String _filter = 'All';

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredTasks = _tasks.where((task) {
      if (_filter == 'All') return true;
      if (_filter == 'Active') return !task['completed'];
      if (_filter == 'Completed') return task['completed'];
      return true;
    }).toList();

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "todos",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 100,
                        color: Color(0xFFdcddfc),
                      ),
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "What needs to be done?",
                    hintStyle: TextStyle(color: Color(0xFF828282)),
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      if (value.isNotEmpty) {
                        _tasks.add({'title': value, 'completed': false});
                      }
                    });
                  },
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TabBar(
                    onTap: (index) {
                      setState(() {
                        _filter = ['All', 'Active', 'Completed'][index];
                      });
                    },
                    tabs: [
                      Tab(child: Text("All")),
                      Tab(child: Text("Active")),
                      Tab(child: Text("Completed")),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredTasks.length,
                    itemBuilder: (context, index) {
                      var task = filteredTasks[index];
                      return ListTile(
                        leading: Checkbox(
                          value: task['completed'],
                          onChanged: (value) {
                            setState(() {
                              task['completed'] = value!;
                            });
                          },
                        ),
                        title: Text(task['title']),
                      );
                    },
                  ),
                ),
                Text(
                  '${_tasks.where((task) => !task['completed']).length} items left',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
