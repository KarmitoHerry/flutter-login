import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
        child: Text("Go to Page 2"),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondRoute()));
        },
      )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
        child: Text("Go Back"),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}
