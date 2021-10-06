import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String lat = "19.123799";
  final String lng = "72.817622";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text("Web URL", style: TextStyle(fontSize: 22)),
              onPressed: () {
                openURL();
              },
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.amber,
              child: Text("Email", style: TextStyle(fontSize: 22)),
              onPressed: () {
                openEmail();
              },
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Phone Call", style: TextStyle(fontSize: 22)),
              onPressed: () {
                phoneCall();
              },
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.purple,
              child: Text("Map", style: TextStyle(fontSize: 22)),
              onPressed: () {
                openMap();
              },
            ),
            SizedBox(
              height: 15,
            ),
          ]))),
    );
  }

  openURL() async {
    const url = 'https://codingwithdhrumil.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openEmail() async {
    launch(
        "mailto:codingwithdhrumil@gmail.com?subject=Test Email&body=Test Description");
  }

  phoneCall() async {
    final String phoneUrl = "tel:1234567890";
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw 'Could not launch $phoneUrl';
    }
  }

  openMap() async {
    final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
    final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    }
    if (await canLaunch(appleMapsUrl)) {
      await launch(appleMapsUrl, forceSafariVC: false);
    } else {
      throw "Couldn't launch URL";
    }
  }
}
