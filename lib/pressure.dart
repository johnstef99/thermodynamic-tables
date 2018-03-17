import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Flexible pres(String label,String monadaMetrisis, String key, int index, List presContext) =>
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
                        presContext[index][key].toString(), style: new TextStyle(
                        color: Colors.orange)),
                  ),
                  new Text(monadaMetrisis, style: new TextStyle(color: Colors.red),)
                ],
              ),

            ),
          )
      ),
    );

class SelectedPres extends StatelessWidget {
  List presContext;
  int index;
  String V = "m^3/kg";
  String energy = "kJ/kg";
  String entropy = "kJ/kg*K";
  String pressure = "kPa";
  String temperature = "°C";

  SelectedPres({this.presContext, this.index});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text(
            'Pressure: ' +
                presContext[index]["p"].toString() + ' kPa')),
        body: new Column(
          children: <Widget>[
            pres("Tsat",temperature, "t", index, presContext),
            pres("Vf",V, "vf", index, presContext),
            pres("Vg",V, "vg", index, presContext),
            pres("Uf",energy, "uf", index, presContext),
            pres("Ufg",energy, "ufg", index, presContext),
            pres("Ug",energy, "ug", index, presContext),
            pres("Hf",energy, "hf", index, presContext),
            pres("Hfg",energy, "hfg", index, presContext),
            pres("Hg",energy, "hg", index, presContext),
            pres("Sf",entropy, "sf", index, presContext),
            pres("Sfg",entropy, "sfg", index, presContext),
            pres("Sg",entropy, "sg", index, presContext),
          ],
        )


    );
  }
}

class Pressure extends StatelessWidget {


  //JSON
  //jSon
  static File presJson;
  static Directory dir;
  static String tempFileName = 'pressure.json';
  static List presContext;
  static int index;


  @override
  void initState() {
    Pressure.getData();
  }

  static void getData() async {
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      presJson = new File(dir.path + "/flutter_assets/files/" + tempFileName);
      presContext = JSON.decode(presJson.readAsStringSync());

      print(presContext[0]["p"]);
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Select Pressure"),
        ),
        body: new ListView.builder(
            itemCount: presContext == null ? 0 : presContext.length,
            itemBuilder: (BuildContext context, int index_1) {
              return new Card(
                  child: new FlatButton(
                    onPressed: () {
                      index = index_1;
                      Navigator.of(context).pushNamed("SelectedPres");
                    },
                    child: new Center(
                      child: new Container(
                          padding: new EdgeInsets.all(15.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                  presContext[index_1]["p"].toString() + ' kPa',
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