import 'package:flutter/material.dart';

// R. Fakhri FD | 5170411153

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 6));

    offset = Tween<Offset>(begin: Offset(-1.11, 0.0), end: Offset(1.1, 0.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/bgtugu.jpg"), fit: BoxFit.cover),
          ),
        child: Stack(
            children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: ButtonTheme(
                minWidth: 200.0,
                height: 50.0,
                buttonColor: Colors.deepPurple,     //  <-- dark color
                textTheme: ButtonTextTheme.primary,
                child: RaisedButton(
                  child: Text('Panggil UFO', style: new TextStyle(
                    fontSize: 20.0),),
                  onPressed: () {
                    switch (controller.status) {
                      case AnimationStatus.completed:
                        controller.reverse();
                        break;
                      case AnimationStatus.dismissed:
                        controller.forward();
                        break;
                      default:
                    }
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: offset,
              child: new Container(
                height: 400.0,
                width: 400.0,
                child: new Image.asset('assets/ufo.png'),
              ),
            ),
          ),
        ],
       ),
      ),
    );
  }
}