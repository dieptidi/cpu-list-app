import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showHide = false;
  Widget body;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    body = new Container();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Intel CPU"),
          bottom: TabBar(
            tabs: [
              Tab(
                // icon: Icon(Icons.computer_sharp),
                text: "i5",
              ),
              Tab(
                icon: Icon(Icons.computer_outlined),
              ),
              Tab(
                icon: Icon(Icons.phone_android),
              )
            ],
          ),
        ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: InkWell(child: Text('Drawer Header'), onTap: ()=>Navigator.pop(context)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                setState(() {
                  showHide = !showHide;
                  body = navBodyDynamic(showHide);
                });
                // Navigator.pop(context);
              },
              selectedTileColor: Colors.blue,
            ),
            body,
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    )
      );
    
  }

  Widget navBodyDynamic(bool _showHide){
    if (!_showHide) return Container();
    else {
      return ListTile(
        title: Text("Data"),
        tileColor: Colors.blue,
      );
    }
  }
}
