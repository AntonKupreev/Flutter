import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter_arhitector/data/app_model.dart';

import 'package:flutter_arhitector/buisness/users.dart';
import 'package:get_it/get_it.dart';
import 'package:module_buissnes/module_buissnes.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<AppModel>(AppModelImplementation(),
      signalsReady: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final imgStream = StreamController<Image>();

  @override
  void dispose() {
    imgStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder(
          stream: imgStream.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Waiting for initialisation'),
                  SizedBox(
                    height: 16,
                  ),
                  CircularProgressIndicator(),
                ],
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {}

            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      getIt<AppModel>().counter.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: getIt<AppModel>().incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            );
          }),
    );
  }
}

void Users() {
  User userA = User(name: 'User', age: 30);
  User userB = User(name: 'User', age: 30);

  print(userA.hashCode);
  print(userB.hashCode);

  print(userA == userB);
}
