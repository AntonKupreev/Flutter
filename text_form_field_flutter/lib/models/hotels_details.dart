import 'dart:math';

import 'package:flutter/material.dart';
import 'package:text_form_field_flutter/models/hotel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HotelDetails extends StatefulWidget {
  final HotelPreview hotelPreview;

  const HotelDetails({super.key, required this.hotelPreview});
  static const routeName = '/hotelsdetails';

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  bool isOk = true;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hotelPreview.name),
      ),
      body: FutureBuilder<HotelInfo>(
        future: getDataHotelInfo(
          widget.hotelPreview.uuid,
          // ignore: invalid_return_type_for_catch_error
        ).catchError((e) => {
              isOk = false,
            }),
        builder: (context, snapshot) {
          if (isOk == false) {
            return const Center(child: Text('Контент не найден!!!'));
          }
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(height: 220.0),
                  items: snapshot.data!.photos.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/$i'),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text('Country:${snapshot.data!.address.country}'),
                Text('City:${snapshot.data!.address.city}'),
                Text('Street:${snapshot.data!.address.street}'),
                Text('Rating:${snapshot.data!.rating}'),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Сервисы',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Платные',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data!.services.free.join("\n"),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              const Text(
                                'Бесплатные',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data!.services.paid.join("\n"),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
