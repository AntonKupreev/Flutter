import 'package:bussines/src/getit_base.dart';
import 'package:flutter/material.dart';

class AppModel extends ChangeNotifier {
  void incrementCounter() {}

  int get counter {
    throw UnimplementedError();
  }
}

class AppModelImplementation extends AppModel {
  int _counter = 0;

  AppImplementation() {
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
