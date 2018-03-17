import 'package:flutter/material.dart';
import 'package:thermodynamic_local/temperature.dart';
import 'package:thermodynamic_local/pressure.dart';
import 'package:thermodynamic_local/loadJSON.dart';
import 'package:share/share.dart';
import 'package:thermodynamic_local/superheated.dart';

void main(){
  loadJSON();
  runApp(new MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Thermodynamic Tables by @john_stef_',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        "SelectedTemp": (BuildContext context) => new SelectedTemp(tempContext: Temperature.tempContext, index: Temperature.index),
        "Temperature": (BuildContext context) => new Temperature(),
        "Pressure" : (BuildContext context) => new Pressure(),
        "SelectedPres" : (BuildContext context) => new SelectedPres(presContext: Pressure.presContext, index: Pressure.index),
        "SuperheatedPressure" : (BuildContext context) => new Superheated(),
        "SuperheatedTemperature" : (BuildContext context) => new SuperheatedTemp(),
        "SuperheatedFinal" : (BuildContext context) => new SuperheatedFinal()

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Card menuItems(String whereTo, String label,) =>
      new Card(
        child: new FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamed(whereTo);
            },
            child: new Center(
                child: new Container(
                    padding: new EdgeInsets.all(15.0),
                    child: new Text(label, style: new TextStyle(
                        color: Colors.green, fontSize: 40.0),)
                )
            )
        ),
      );




  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Select Table"),
        ),
        body: new ListView(
          children: <Widget>[
            menuItems("Temperature", "Temperature"),
            menuItems("Pressure", "Pressure"),
            menuItems("SuperheatedPressure", "Superheated"),

          ],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: (){
            share('Check this app http://users.auth.gr/istefanidi/tables.apk');
          },
          child: new Icon(Icons.share),
        ),
    );
  }

}



