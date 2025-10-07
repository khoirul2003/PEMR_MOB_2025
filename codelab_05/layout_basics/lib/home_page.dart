import 'package:flutter/material.dart';
import 'package:layout_basics/layout_pages/lists_grids_page/basic_list_page.dart';
import 'package:layout_basics/layout_pages/lists_grids_page/grid_lists_page.dart';
import 'package:layout_basics/layout_pages/lists_grids_page/horizontal_list_page.dart';
import 'package:layout_basics/layout_pages/lists_grids_page/long_lists_page.dart';
import 'package:layout_basics/layout_pages/lists_grids_page/mixed_list_page.dart';
import 'package:layout_basics/layout_pages/lists_grids_page/spaced_items_page.dart';
import 'package:layout_basics/layout_pages/scrolling_page/floating_app_bar_page.dart';
import 'package:layout_basics/layout_pages/scrolling_page/parallax_scrolling_page.dart';
import 'package:layout_basics/layout_pages/scrolling_page/scrolling_overview_page.dart';
import 'package:layout_basics/layout_pages/scrolling_page/slivers_page.dart';
import 'layout_pages/introduction_page.dart';
import 'layout_pages/build_layout_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Layout Demo')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Flutter Layout Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Introduction'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IntroductionPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('Build a Layout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BuildLayoutPage()),
                );
              },
            ),
            ExpansionTile(
              leading: Icon(Icons.list),
              title: Text('Lists & Grids'),
              children: <Widget>[
                ListTile(
                  title: Text('Basic List'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BasicListPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Horizontal List'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HorizontalListPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Grid Lists'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GridListsPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Mixed List'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MixedListPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Spaced Items'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpacedItemsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Long Lists'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LongListsPage()),
                    );
                  },
                ),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.arrow_downward),
              title: Text('Scrolling'),
              children: <Widget>[
                ListTile(
                  title: Text('Overview'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScrollingOverviewPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Slivers'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SliversPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text('Floating App Bar'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FloatingAppBarPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Parallax Scrolling'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParallaxScrollingPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(child: Text('Muhammad Khoirul Anwarudin - 2441070230007')),
    );
  }
}
