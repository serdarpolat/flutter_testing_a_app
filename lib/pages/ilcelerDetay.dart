import 'package:flutter/material.dart';

import '../models/model_deneme.dart';

class IlcelerDetay extends StatefulWidget {
  final Bilgiler bilgiler;

  IlcelerDetay({this.bilgiler});

  @override
  _IlcelerDetayState createState() => _IlcelerDetayState();
}

class _IlcelerDetayState extends State<IlcelerDetay>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Icon(Icons.search),
            onTap: () {},
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(widget.bilgiler.ilce),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              // image: DecorationImage(
              //     image: AssetImage("assets/images/logo.png"),
              //     fit: BoxFit.contain),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            child: ExpansionTile(
                              title: Text("Mahalleler"),
                              children: widget.bilgiler.mahalle != null
                                  ? widget.bilgiler.mahalle
                                      .map(
                                        (e) => ActionChip(
                                          backgroundColor: Colors.red,
                                          onPressed: () {
                                            debugPrint(e.mahalleTemsilcisi);
                                          },
                                          label: Text(
                                            e.mahalleAdi,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                      .toList()
                                  : Text("Son"),
                            ),
                          );
                        }),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            child: ExpansionTile(
                              maintainState: true,
                              title: Text("Köyler"),
                              children: widget.bilgiler.koyler != null
                                  ? widget.bilgiler.koyler
                                      .map(
                                        (e) => ActionChip(
                                          backgroundColor: Colors.red,
                                          onPressed: () {
                                            debugPrint(e.koyTemsilcisi);
                                          },
                                          label: Text(
                                            e.koyAdi,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                      .toList()
                                  : Text("Son"),
                            ),
                          );
                        }),
                  ),
                )
              ],
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                        // backgroundImage: AssetImage("assets/images/logo.png"),
                        backgroundColor: Colors.red,
                      ),
                      Text(""),
                      Text("İlçe Nüfusu : " + widget.bilgiler.nufus),
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
        child: Icon(Icons.info),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
