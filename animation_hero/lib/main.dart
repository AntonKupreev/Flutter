import 'package:flutter/material.dart';
import 'package:animation_hero/space.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: Card(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: spaces
              .map(
                (space) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => DetailView(
                              data: space,
                            )),
                      ),
                    );
                  },
                  child: Column(children: [
                    Stack(children: [
                      Hero(
                        tag: space.id,
                        child: Image.asset(space.image),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Hero(
                          tag: '${space.id}-button',
                          child: Material(
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.red,
                              child: Icon(Icons.play_arrow),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Hero(
                      tag: '${space.id}-title',
                      child: Material(
                        child: Text(space.description),
                      ),
                    ),
                  ]),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({Key key, this.data});
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(children: [
                Hero(
                  tag: data.id,
                  child: Image.asset(data.image),
                ),
                Positioned(
                  bottom: 2,
                  right: 2,
                  child: Hero(
                    tag: '${data.id}-button',
                    child: Material(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.red,
                        child: Icon(Icons.play_arrow),
                      ),
                    ),
                  ),
                )
              ]),
              SizedBox(
                height: 5,
              ),
              Hero(
                tag: '${data.id}-title',
                child: Material(child: Text(data.description)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
