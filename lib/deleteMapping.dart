import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/Product.dart';
class DeleteMappingMethod extends StatefulWidget {
  @override
  _DeleteMappingMethodState createState() => _DeleteMappingMethodState();
}

class _DeleteMappingMethodState extends State<DeleteMappingMethod> {
  final FocusNode myFocusNodeProductId = FocusNode();
  var kayitIdKontrolu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api Kullanımı"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 23.0,left: 50),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: [
                Card(
                  elevation: 2.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: 300.0,
                    height: 90.0,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextField(
                            focusNode: myFocusNodeProductId,
                            controller: kayitIdKontrolu,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            style:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Product Id Giriniz",
                              hintStyle: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Theme.of(context).accentColor.withOpacity(0.2),
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                      BoxShadow(
                        color: Theme.of(context).accentColor.withOpacity(0.2),
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0,
                      ),
                    ],
                    color: Colors.grey,
                  ),
                  child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          "Kayıt Sil",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        var productId = kayitIdKontrolu.text.toString();
                        await deleteProduct(productId);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<http.Response> deleteProduct(String id) async {
    final http.Response response = await http.delete(
      'http://192.168.1.101:8080/api/products/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return response;
  }
}
