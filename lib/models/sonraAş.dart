import 'package:flutter/material.dart';

import '../models/model_deneme.dart';

class IlcelerDetay extends StatefulWidget {
  Bilgiler bilgiler;
  IlcelerDetay(this.bilgiler);

  @override
  _IlcelerDetayState createState() => _IlcelerDetayState();
}

class _IlcelerDetayState extends State<IlcelerDetay>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(widget.bilgiler.ilce),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: 1,
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
                        title: Column(
                          children: widget.bilgiler.mahalle != null
                              ? widget.bilgiler.mahalle
                                  .map(
                                    (e) => ActionChip(
                                      onPressed: () {
                                        debugPrint(e.mahalleTemsilcisi);
                                      },
                                      label: Text(e.mahalleAdi),
                                    ),
                                  )
                                  .toList()
                              : Text("Son"),
                        ),
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
                    return Card(
                      color: Colors.white60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        ),
                      ),
                      child: ListTile(
                        title: Column(
                          children: widget.bilgiler.koyler != null
                              ? widget.bilgiler.koyler
                                  .map(
                                    (e) => Chip(
                                      label: Text(e.koyAdi),
                                    ),
                                  )
                                  .toList()
                              : Text("Son"),
                        ),
                      ),
                    );
                  }),
            ),
          )
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
                        backgroundImage: AssetImage("assets/images/logo.png"),
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
