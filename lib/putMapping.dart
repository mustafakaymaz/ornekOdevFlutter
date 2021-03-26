import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PutMappingMethod extends StatefulWidget {
  @override
  _PutMappingMethodState createState() => _PutMappingMethodState();
}

class _PutMappingMethodState extends State<PutMappingMethod> {
  final FocusNode myFocusNodeProductName = FocusNode();
  final FocusNode myFocusNodeProductType = FocusNode();
  final FocusNode myFocusNodeProductId = FocusNode();


  var kayitIdKontrolu = TextEditingController();
  var kayitNameKontrolu = TextEditingController();
  var kayitTypeKontrolu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api Kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10.0, left: 50),
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
                      height: 280.0,
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
                                hintText: "Product Id",
                                hintStyle: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: myFocusNodeProductName,
                              controller: kayitNameKontrolu,
                              keyboardType: TextInputType.text,
                              style:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Product Name",
                                hintStyle: TextStyle(fontSize: 16.0),

                              ),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                            child: TextField(
                              focusNode: myFocusNodeProductType,
                              controller: kayitTypeKontrolu,
                              keyboardType: TextInputType.text,
                              style:
                              TextStyle(fontSize: 16.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Product Type",
                                hintStyle: TextStyle(fontSize: 16.0),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 290.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Theme
                              .of(context)
                              .accentColor
                              .withOpacity(0.2),
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                        BoxShadow(
                          color: Theme
                              .of(context)
                              .accentColor
                              .withOpacity(0.2),
                          offset: Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                      ],
                      color: Colors.grey,
                    ),
                    child: MaterialButton(
                        highlightColor: Colors.transparent,
                        splashColor: Theme
                            .of(context)
                            .accentColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 42.0),
                          child: Text(
                            "Guncelle",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          var productId = kayitIdKontrolu.text.toString();
                          var productName= kayitNameKontrolu.text;
                          var productType= kayitTypeKontrolu.text;
                          await updateProduct(productId,productName,productType);
                        }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<http.Response> updateProduct(String productId, String productName, String productType) {
    return http.put(
      'http://192.168.1.101:8080/api/products/update/$productId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'productId': productId,
        'productName': productName,
        'productType': productType,
      }),
    );
  }
}