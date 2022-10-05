import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  int _selectedIndex = 0;
  static const TextStyle mainText = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 40, color: Colors.blueAccent);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Photo',
      style: mainText,
    ),
    Text(
      'Index 1: Chat',
      style: mainText,
    ),
    Text(
      'Index 2: Albums',
      style: mainText,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.person),
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.limeAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://mywordshindi.com/wp-content/uploads/2022/04/hidden-face-dp-girls-4.png'),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward),
              onLongPress: () {},
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.file_copy_outlined),
              trailing: const Icon(Icons.arrow_forward),
              onLongPress: () {},
            ),
            ListTile(
              title: const Text('Images'),
              leading: const Icon(Icons.image),
              trailing: const Icon(Icons.arrow_forward),
              onLongPress: () {},
            ),
            const SizedBox(
              height: 200,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.red, // foreground
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Выход',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background
                    onPrimary: Colors.blue, // foreground
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Регистрация',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 10,
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: 'Photo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.album),
              label: 'Albums',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://mywordshindi.com/wp-content/uploads/2022/04/hidden-face-dp-girls-4.png'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'UserName',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Open'),
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Colors.amber,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Сумма'),
                        leading: const Icon(Icons.credit_card),
                        trailing: const Text('200 rub.'),
                        onLongPress: () {},
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Оплатить'),
                      ),
                    ],
                  ),
                );
              });
        },
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
