import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTweenAnimation(),
    );
  }
}

class MyTweenAnimation extends StatefulWidget {
  @override
  _MyTweenAnimationState createState() => _MyTweenAnimationState();
}

class _MyTweenAnimationState extends State<MyTweenAnimation> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween Animation Builder Example'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          duration: Duration(seconds: 2),
          tween: Tween<double>(begin: 1.0, end: _scale),
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.scale(
              scale: value,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _scale = _scale == 1.0 ? 2.0 : 1.0;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
