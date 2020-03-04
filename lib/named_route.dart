import 'package:flutter/material.dart';
import 'package:navigation/model.dart';
import 'component.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Go to Second Screen"),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            RaisedButton(
              child: Text("Go to Second With Title"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen("Some title")));
              },
            ),
            RaisedButton(
              child: Text("Show Info"),
              onPressed: () {
                var contact = Contact("John", "Johndo@gmail.com","08629090","https://seeklogo.net/wp-content/uploads/2012/12/premier-league-logo-vector.png");

                Navigator.pushNamed(context, InfoScreen.routeName,
                    arguments: contact);
              },
            ),
            ConfirmButton()
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String title;

  const SecondScreen([this.title = "default"]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
          child: RaisedButton(
        child: Text("Go to First Screen"),
        onPressed: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}

class InfoScreen extends StatelessWidget {
  static const routeName = '/info';

  @override
  Widget build(BuildContext context) {
    final Contact arguments = ModalRoute.of(context).settings.arguments;



    var rating = SmoothStarRating(
        allowHalfRating: false,
        onRatingChanged: (v) {
          //rating = v;
          //setState(() {});
        },
        starCount: 5,
        rating: 0,
        size: 40.0,
        color: Colors.lightBlue,
        borderColor: Colors.blue,
        spacing:0.0
    );


    return Scaffold(
      appBar: AppBar(
        title : Text(arguments.name),
      ),
      body: Padding(
          padding: EdgeInsets.only(left:10, top:20, right: 10),
          child: Column(
            children: <Widget>[
              Image.network(arguments.urlImage),
              Infoline("Name", arguments.name),
              Divider(),
              Infoline("Phone Number", arguments.phoneNumber),
              rating,
            ],
          ),
      ),
    );
  }
}
