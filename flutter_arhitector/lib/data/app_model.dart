import 'package:flutter/material.dart';

import '../main.dart';

class App extends ChangeNotifier {
  void incrementCounter() {
    // TODO: implement incrementCounter
  }

  int get counter {
    // TODO: implement counter
    throw UnimplementedError();
  }
}

class AppModelImplementation extends App {
  int _counter = 0;

  AppImplementation() {
    /// lets pretend we have to do some async initialization
    Future.delayed(Duration(seconds: 3)).then((_) => getIt.signalReady(this));
  }

  @override
  int get counter => _counter;

  @override
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
