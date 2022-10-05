import 'package:flutter/material.dart';

final List<String> users = List<String>.generate(100, ((index) => '$index'));
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text('$index'),
                ),
              );
            }),
        appBar: AppBar(
          title: const Text("Horizontal"),
        ),
      ),
    ),
  );
}
