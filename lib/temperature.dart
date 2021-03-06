import 'package:flutter/material.dart';


Flexible temp(String label,String monadaMetrisis, String key, int index, List tempContext) =>
    new Flexible(
      child: new Card(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Flexible(
                  child: new Text(label,
                  style: new TextStyle(color: Colors.blue,fontSize: 30.0,)
                  ),
                ),
                new Flexible(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                        tempContext[index][key].toString(), style: new TextStyle(
                        color: Colors.orange)),
                      new Flexible(
                        child: new Text(
                          monadaMetrisis,overflow: TextOverflow.ellipsis, 
                          style: new TextStyle(
                            color: Colors.red,
                            fontSize: 10.0,
                            fontFamily: 'Roboto',
                          ),
                        )
                      )
                      ],
                    ),
                )
                
              ],
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
        body: new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              temp("Psat", pressure, "p", index, tempContext),
              new Flexible(
                              child: new Row(
                  children: <Widget>[
                    temp("Vf", V, "vf", index, tempContext),
                    temp("Vg",V, "vg", index, tempContext),
                  ],
                ),
              ),
              new Flexible(
                              child: new Row(
                  children: <Widget>[
                    temp("Uf",energy, "uf", index, tempContext),
                    temp("Ufg",energy, "ufg", index, tempContext),
                    temp("Ug",energy, "ug", index, tempContext),
                  ],
                ),
              ),
              new Flexible(
                child: new Row(
                  children: <Widget>[
                    temp("Hf",energy, "hf", index, tempContext),
                    temp("Hfg",energy, "hfg", index, tempContext),
                    temp("Hg",energy, "hg", index, tempContext),  
                  ],
                )
              ),
              new Flexible(
                child: new Row(
                  children: <Widget>[
                    temp("Sf",entropy, "sf", index, tempContext),
                    temp("Sfg",entropy, "sfg", index, tempContext),
                    temp("Sg",entropy, "sg", index, tempContext)
                  ],
                )
              )
            ],
          ),
        )


    );
  }
}

class Temperature extends StatelessWidget {

  //JSON
  //jSon
 
  static List tempContext;
  static int index;


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