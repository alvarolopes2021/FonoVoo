import 'package:flutter/material.dart';

class ClassesListPage extends StatefulWidget {
  const ClassesListPage({super.key, required this.title});

  final String title;

  @override
  State<ClassesListPage> createState() => _ClassesListPageState();
}

class _ClassesListPageState extends State<ClassesListPage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromRGBO(0, 90, 152, 1),
                Color.fromRGBO(0, 100, 162, 1),
                Color.fromRGBO(0, 110, 172, 1),
              ], // Gradient from,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              Card(
                margin: EdgeInsets.all(15),
                elevation: 2,
                shadowColor: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.school),
                  title: Text(
                    "Josefa Torres",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
