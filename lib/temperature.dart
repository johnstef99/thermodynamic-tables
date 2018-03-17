import 'dart:io';
import 'package:flutter/material.dart';
import 'package:isolate/load_balancer.dart';



Flexible temp(String label,String monadaMetrisis, String key, int index, List tempContext) =>
    new Flexible(
      child: new Card(
          child: new Center(
            child: new Container(
              padding: new EdgeInsets.all(10.0),
              child: new Row(
                children: <Widget>[
                  new Text(label + ': ',
                      style: new TextStyle(color: Colors.blue)
                  ),
                  new Flexible(
                    fit: FlexFit.tight,
                    child: new Text(
                        tempContext[index][key].toString(), style: new TextStyle(
                        color: Colors.orange)),
                  ),
                  new Text(monadaMetrisis, style: new TextStyle(color: Colors.red),)
                ],
              ),

            ),
          )
      ),
    );

class SelectedTemp extends StatelessWidget {
  List tempContext;
  int index;
  String V = "m^3/kg";
  String energy = "kJ/kg";
  String entropy = "kJ/kg*K";
  String pressure = "kPa";

  SelectedTemp({this.tempContext, this.index});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(
            'Temperature: ' +
                tempContext[index]["t"].toString() + ' °C')),
        body: new Column(
          children: <Widget>[
            temp("Psat", pressure, "p", index, tempContext),
            temp("Vf", V, "vf", index, tempContext),
            temp("Vg",V, "vg", index, tempContext),
            temp("Uf",energy, "uf", index, tempContext),
            temp("Ufg",energy, "ufg", index, tempContext),
            temp("Ug",energy, "ug", index, tempContext),
            temp("Hf",energy, "hf", index, tempContext),
            temp("Hfg",energy, "hfg", index, tempContext),
            temp("Hg",energy, "hg", index, tempContext),
            temp("Sf",entropy, "sf", index, tempContext),
            temp("Sfg",entropy, "sfg", index, tempContext),
            temp("Sg",entropy, "sg", index, tempContext),
          ],
        )


    );
  }
}

class Temperature extends StatelessWidget {

  //JSON
  //jSon
  static File tempJson;
  static Directory dir;
  static String tempFileName = 'temperature.json';
  static List tempContext;
  static int index;


  @override
  void initState() {
  }

  static void getData() async {
    /*getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      print(dir.path);
      tempJson = new File(dir.path + "/flutter_assets/files/" + tempFileName);
      tempContext = JSON.decode(tempJson.readAsStringSync());


    });*/
    //tempContext = loadAsset();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Select Temperature"),
        ),
        body: new ListView.builder(
            itemCount: tempContext == null ? 0 : tempContext.length,
            itemBuilder: (BuildContext context, int index_1) {
              return new Card(
                  child: new FlatButton(
                    onPressed: () {
                      index = index_1;
                      Navigator.of(context).pushNamed("SelectedTemp");
                    },
                    child: new Center(
                      child: new Container(
                          padding: new EdgeInsets.all(15.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                  tempContext[index_1]["t"].toString() + ' °C',
                                  style: new TextStyle(
                                      color: Colors.blue, fontSize: 20.0)),
                            ],
                          )
                      ),
                    ),
                  )
              );
            }
        ));
  }
}