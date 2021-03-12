import 'package:flutter/material.dart';
import 'package:instagram_cloning_app/models/story.dart';

import 'components/post.dart';

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

  List<Story> _stories = [
    Story(
        'assets/avatar.JPG',
        'name1'
    ),
    Story(
        'assets/avatar.JPG',
        'name2'
    ),
    Story(
        'assets/avatar.JPG',
        'name3'
    ),
    Story(
        'assets/avatar.JPG',
        'name4'
    ),
    Story(
        'assets/avatar.JPG',
        'name4'
    ),
    Story(
        'assets/avatar.JPG',
        'name4'
    ),
    Story(
        'assets/avatar.JPG',
        'name4'
    ),
    Story(
        'assets/avatar.JPG',
        'name4'
    ),
  ];

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(
                vertical: 10
              ),
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story) {
                  return Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            border: Border.all(
                                width: 3,
                                color: Color(0xFF8e44ad)
                            )
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image(
                              image: AssetImage(story.image),
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
            Post(),
            Post(),
            Post(),
          ],
        ),
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

