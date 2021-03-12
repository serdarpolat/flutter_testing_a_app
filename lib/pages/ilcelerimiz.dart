import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/model_deneme.dart';

import 'ilcelerDetay.dart';

class Ilcelerimiz extends StatefulWidget {
  @override
  _IlcelerimizState createState() => _IlcelerimizState();
}

class _IlcelerimizState extends State<Ilcelerimiz>
    with AutomaticKeepAliveClientMixin {
  KastamonuJson kastamonuJson;
  Future<KastamonuJson> veri;
  Bilgiler seciliIndex;

  //String url = "https://raw.githubusercontent.com/SevdanurGENC/Mobile-Programming-Lecture-Notes/main/refah.json";
  String url =
      "https://raw.githubusercontent.com/SevdanurGENC/Mobile-Programming-Lecture-Notes/main/refah_.json";

  Future<KastamonuJson> bilgileriGetir() async {
    var response = await http.get(url);
    var decodedJson = json.decode(response.body);
    kastamonuJson = KastamonuJson.fromJson(decodedJson);
    return kastamonuJson;
  }

  @override
  void initState() {
    super.initState();
    veri = bilgileriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: veri,
        builder: (context, AsyncSnapshot<KastamonuJson> gelenVeri) {
          if (gelenVeri.connectionState == ConnectionState.done) {
            if (gelenVeri.hasError) {
              return Center(
                child: Text(
                  gelenVeri.error,
                ),
              );
            }

            return ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        // backgroundImage:
                        //     AssetImage(gelenVeri.data.bilgiler[index].resim),
                        backgroundColor: Colors.red,
                      ),
                      title: Text(gelenVeri.data.bilgiler[index].ilce),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.red,
                      ),
                      onTap: () {
                        this.seciliIndex = gelenVeri.data.bilgiler[index];

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IlcelerDetay(
                                bilgiler: gelenVeri.data.bilgiler[index]),
                          ),
                        );
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    topLeft: Radius.circular(25),
                                  ),
                                ),
                                title: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage(
                                          gelenVeri.data.bilgiler[index].resim),
                                      backgroundColor: Colors.red,
                                    ),
                                    Text(""),
                                    Text(gelenVeri.data.bilgiler[index].baskan),
                                    Text(""),
                                    Text(
                                        gelenVeri.data.bilgiler[index].telefon),
                                  ],
                                ),
                                actions: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.done),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  );
                });
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ));
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
