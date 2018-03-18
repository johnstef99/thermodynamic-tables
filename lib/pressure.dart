import 'package:flutter/material.dart';

Flexible pres(String label,String monadaMetrisis, String key, int index, List presContext) =>
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
                        presContext[index][key].toString(), style: new TextStyle(
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
              new Flexible(
                              child: new Row(
                  children: <Widget>[
                    pres("Vf",V, "vf", index, presContext),
                    pres("Vg",V, "vg", index, presContext),
                  ],
                ),
              ),
              new Flexible(
                              child: new Row(
                  children: <Widget>[
                    pres("Uf",energy, "uf", index, presContext),
                    pres("Ufg",energy, "ufg", index, presContext),
                    pres("Ug",energy, "ug", index, presContext),
                  ],
                ),
              ),
              new Flexible(
                child: new Row(
                  children: <Widget>[
                    pres("Hf",energy, "hf", index, presContext),
                    pres("Hfg",energy, "hfg", index, presContext),
                    pres("Hg",energy, "hg", index, presContext),
                  ],
                )
              ),
              new Flexible(
                child: new Row(
                  children: <Widget>[
                    pres("Sf",entropy, "sf", index, presContext),
                    pres("Sfg",entropy, "sfg", index, presContext),
                    pres("Sg",entropy, "sg", index, presContext),
                  ],
                )
              )
            
          ],
        )


    );
  }
}

class Pressure extends StatelessWidget {


 
  static List presContext;
  static int index;





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