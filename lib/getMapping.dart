import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:json_api_kulanimi/models/Product.dart';
import 'package:http/http.dart' as http;

class GetMappingMethod extends StatefulWidget {
  @override
  _GetMappingMethodState createState() => _GetMappingMethodState();
}

class _GetMappingMethodState extends State<GetMappingMethod> {
  Future<List<Product>> _gonderiGetir() async {
    var response = await http.get("http://192.168.1.101:8080/api/products");
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((tekGonderiMap) => Product.fromJson(tekGonderiMap))
          .toList();
    } else {
      throw Exception("Bağlanamadı : ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api Kullanımı"),
      ),
      body: FutureBuilder(
          future: _gonderiGetir(),
          builder: (context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemCount:snapshot.data.length ,itemBuilder: (context, index){
                return ListTile(
                  title:  Text(snapshot.data[index].productName),
                  subtitle: Text(snapshot.data[index].productType),
                  leading: CircleAvatar(child: Text(snapshot.data[index].productId.toString(),),),
                );
              });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
