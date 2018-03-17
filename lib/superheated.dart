import 'package:flutter/material.dart';




class SuperheatedFinal extends StatelessWidget{

  int index_in = SuperheatedTemp.index_out;
  String pressure = Superheated.pressure;
  String V = "m^3/kg";
  String energy = "kJ/kg";
  String entropy = "kJ/kg*K";
  String pressureM = "kPa";

  @override
  Widget build(BuildContext context) {

    Flexible superheated(String label,String monadaMetrisis, String key) =>
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
                        Superheated.superheatedContext[index_in][key].toString(), style: new TextStyle(
                        color: Colors.orange)
                        ),
                  ),
                  new Text(monadaMetrisis, style: new TextStyle(color: Colors.red),)
                ],
              ),

            ),
          )
      ),
    );



    return new Scaffold(
        appBar: new AppBar(title: new Text('P:' + pressure + 'MPa T:'+ Superheated.superheatedContext[index_in]["t"].toString()+'°C')),
        body: new Column(
          children: <Widget>[
            superheated("V", V, "v"),
            superheated("U", energy, 'u'),
            superheated("H", energy, 'h'),
            superheated("S", entropy, 's')
          ],
        ),
    );
  }

}

class SuperheatedTemp extends StatelessWidget {
  
  List superheatedContext = Superheated.superheatedContext;
  String pressure = Superheated.pressure;
  static int index_out;
  String V = "m^3/kg";
  String energy = "kJ/kg";
  String entropy = "kJ/kg*K";
  String pressureM = "kPa";
  String temperature = "°C";


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Pressure: ' + pressure+ ' MPa')
            ),
            body: new ListView.builder(
              itemCount: superheatedContext == null ? 0 : superheatedContext.length,
              itemBuilder: (BuildContext context, int index){
                if(superheatedContext[index]["p"].toString() == pressure){
                  return new Card(
                  child: new FlatButton(
                    onPressed: () {
                      index_out = index;
                      Navigator.of(context).pushNamed("SuperheatedFinal");
                      
                    },
                    child: new Center(
                      child: new Container(
                          padding: new EdgeInsets.all(15.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                  superheatedContext[index]["t"].toString() + ' ' + temperature,
                                  style: new TextStyle(
                                      color: Colors.blue, fontSize: 20.0)),
                            ],
                          )
                      ),
                    ),
                  )
              );
                }else{
                  return new Text('');
                }
              },
            ),
        


    );
  }
}

class Superheated extends StatelessWidget {


 
  static List superheatedContext;
  static String pressure = "";





  @override
  Widget build(BuildContext context) {

    Card pressureItem(String pressure_in) => new Card(
                  child: new FlatButton(
                    onPressed: () {
                      pressure = pressure_in;
                      Navigator.of(context).pushNamed("SuperheatedTemperature");
                      
                    },
                    child: new Center(
                      child: new Container(
                          padding: new EdgeInsets.all(15.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                  pressure_in + ' MPa',
                                  style: new TextStyle(
                                      color: Colors.blue, fontSize: 20.0)),
                            ],
                          )
                      ),
                    ),
                  )
              );

    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Select Pressure"),
        ),
        body: new ListView(
          children: <Widget>[
            pressureItem("0.01"),
            pressureItem("0.05"),
            pressureItem("0.1"),
            pressureItem("0.2"),
            pressureItem("0.3"),
            pressureItem("0.4"),
            pressureItem("0.5"),
            pressureItem("0.6"),
            pressureItem("0.8"),
            pressureItem("1"),
            pressureItem("1.2"),
            pressureItem("1.4"),
            pressureItem("1.6"),
            pressureItem("1.8"),
            pressureItem("2"),
            pressureItem("2.5"),
            pressureItem("3"),
            pressureItem("3.5"),
          ],
        )
        );
  }

  
}
