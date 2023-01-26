import 'package:flutter_arhitector/data/app_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<App>(App());

  GetIt.I.registerSingleton<App>(App());
}
