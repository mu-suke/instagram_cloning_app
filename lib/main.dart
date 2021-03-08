import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  static const _footerItems = [
    {
      'icon': Icons.home_filled,
      'name': 'ホーム',
    },
    {
      'icon': Icons.search,
      'name': 'さがす',
    },
    {
      'icon': Icons.movie_creation_outlined,
      'name': 'ホーム',
    },
    {
      'icon': Icons.shopping_bag_outlined,
      'name': 'ホーム',
    },
    {
      'icon': Icons.person_outline,
      'name': 'マイページ',
    }
  ];

  @override
  void initState() {
    super.initState();
    _bottomNavigationBarItems.add(_updateActiveState(0));
    for (var i = 1; i < _footerItems.length; i++) {
      _bottomNavigationBarItems.add(_updateDeactiveState(i));
    }
  }

  BottomNavigationBarItem _updateActiveState(int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          _footerItems[index]['icon'],
          color: Colors.black87,
        ),
        label: _footerItems[index]['name'],
    );
  }

  BottomNavigationBarItem _updateDeactiveState(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerItems[index]['icon'],
        color: Colors.black26,
      ),
      label: _footerItems[index]['name'],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomNavigationBarItems[_selectedIndex] = _updateDeactiveState(_selectedIndex);
      _bottomNavigationBarItems[index] = _updateActiveState(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo.png',
          height: 50,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_box_outlined), onPressed: null),
          IconButton(icon: Icon(Icons.favorite_border), onPressed: null),
          IconButton(icon: Icon(Icons.send), onPressed: null),
        ],
        bottom: PreferredSize(
          preferredSize: Size(375, 50),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.JPG'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.JPG'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.JPG'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.JPG'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.JPG'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.JPG'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.JPG'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.JPG'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.JPG'),
              ),
            ],
          )
        ),
      ),
      body: Center(
        child: Text('Home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

