import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:text_form_field_flutter/models/hotel.dart';
import 'package:text_form_field_flutter/models/hotels_details.dart';
import 'package:text_form_field_flutter/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomeView.routeName:
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return const HomeView();
              },
            );
          case HotelDetails.routeName:
            final hotelPreview = settings.arguments as HotelPreview;
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return HotelDetails(hotelPreview: hotelPreview);
              },
            );
        }
      },
    );
  }
}
