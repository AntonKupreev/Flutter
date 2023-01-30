import 'package:flutter/material.dart';
import 'package:module_buissnes/src/getit_base.dart';

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
