import 'package:flutter/material.dart';
import 'package:json_api_kulanimi/deleteMapping.dart';
import 'package:json_api_kulanimi/postMapping.dart';
import 'package:json_api_kulanimi/putMapping.dart';


import 'getMapping.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: ButtunSinif(),

    );
  }
}

class ButtunSinif extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Json Ve Api"),
        ),
        body: Container(
          child: Column(
            children: [
              Center(
                child: RaisedButton(
                  child: Text("Gönderi Ekle"),
                  color: Colors.green,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> PostMappingMethod()));
                  },
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text("Gönderi Sil"),
                  color: Colors.red,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DeleteMappingMethod()));
                  },
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text("Gönderi Guncelle"),
                  color: Colors.orange,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PutMappingMethod()));
                  },
                ),
              ),

              Center(
                child: RaisedButton(
                  child: Text("GonderiGetir"),
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> GetMappingMethod()));
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }


}

