import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new CollectionWidget()
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme
          .of(context)
          .primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    Widget bottom = new Container(
      padding: new EdgeInsets.all(32.0),
      child: new Column(
        children: <Widget>[
          new SizedBox(
            height: 210.0,
            child: new Card(
              elevation: 5.0,
              child: new Column(
                children: [
                  new ListTile(
                    title: new Text('1625 Main Street',
                        style: new TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: new Text('My City, CA 99984'),
                    leading: new Icon(
                      Icons.restaurant_menu,
                      color: Colors.blue[500],
                    ),
                  ),
                  new Divider(),
                  new ListTile(
                    title: new Text('(408) 555-1212',
                        style: new TextStyle(fontWeight: FontWeight.w500)),
                    leading: new Icon(
                      Icons.contact_phone,
                      color: Colors.blue[500],
                    ),
                  ),
                  new ListTile(
                    title: new Text('costa@example.com'),
                    leading: new Icon(
                      Icons.contact_mail,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),);

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Top Lakes'),
        ),
        body: new ListView(
          shrinkWrap: true,
          children: [
            new Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            bottom,
            new Container(
                padding: const EdgeInsets.all(10.0),
                child:
            new Center(child: new TextField(
              decoration: new InputDecoration(hintText: "hehe",errorText: "error"),),),)
          ],
        ),
      ),
    );
  }

}

class CollectionWidget extends StatefulWidget {
  @override
  _CollectionState createState() {
    return new _CollectionState();
  }
}

class _CollectionState extends State<CollectionWidget> {
  bool isCollection = false;
  int collectionNum = 40;

  void _collectionRefresh() {
    setState(() {
      if (isCollection) {
        collectionNum = 40;
        isCollection = false;
      } else {
        collectionNum = 41;
        isCollection = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new Container(
        child: new IconButton(
            icon: isCollection ? new Icon(Icons.star,
              color: Colors.red[500],) : new Icon(
                Icons.star_border),
            onPressed: _collectionRefresh),
      ),
      new SizedBox(
        width: 18.0,
        child: new Container(
          child: new Text('$collectionNum'),
        ),
      ),
    ],);
  }
}
