import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:text_form_field_flutter/models/hotel.dart';
import 'package:text_form_field_flutter/models/hotels_details.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  late List<HotelPreview> hotelslist;

  @override
  void initState() {
    super.initState();
    getData();
    isLoading = true;
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    setState(() {
      isLoading = false;
    });
  }

  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isGridView = false;
              });
            },
            icon: const Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isGridView = true;
              });
            },
            icon: const Icon(Icons.grid_view),
          )
        ],
      ),
      body: FutureBuilder<List<HotelPreview>>(
        future: getDataHotels(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return isGridView
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                          left: 5,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                //flex: 3,
                                fit: FlexFit.tight,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/images/${snapshot.data![index].poster}'),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  snapshot.data![index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/hotelsdetails',
                                      arguments: snapshot.data![index]);
                                },
                                child: const Text(
                                  'Подробнее',
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          onTap: () {
                            Navigator.pushNamed(context, '/hotelsdetails',
                                arguments: snapshot.data![index].uuid);
                          },
                          title: Image(
                            image: AssetImage(
                                'assets/images/${snapshot.data![index].poster}'),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(snapshot.data![index].name),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/hotelsdetails',
                                      arguments: snapshot.data![index].uuid,
                                    );
                                  },
                                  child: const Text('Подробнее')),
                            ],
                          ),

                          //  isThreeLine: false,
                        ),
                      );
                    }),
                  );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
