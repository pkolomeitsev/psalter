import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setup() async {
    Navigator.pushReplacementNamed(context, '/psalter', arguments: {
      'booked_kathismas': [2,4]
    });
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(child: SpinKitFadingCube(color: Colors.white, size: 50.0)),
    );
  }
}
