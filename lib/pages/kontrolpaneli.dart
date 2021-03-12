import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/models/floatingButton.dart';
import 'package:myapp/pages/drawer.dart';
import 'package:myapp/pages/ilcelerimiz.dart';
import 'package:myapp/pages/programCetveli.dart';

import 'anasayfa.dart';
import 'basindaBiz.dart';

class IlcelerJSON extends StatefulWidget {
  @override
  _IlcelerJSONState createState() => _IlcelerJSONState();
}

class _IlcelerJSONState extends State<IlcelerJSON>
    with TickerProviderStateMixin {
  var mainTitle = "Ana Sayfa";
  TabController _tabController;

  List<String> basliklar = [
    "Anasayfa",
    "İlçelerimiz",
    "Basında Biz",
    "Program Cetveli"
  ];

  List<Widget> sayfalar = [
    Tab(text: 'Anasayfa', icon: Icon(Icons.home)),
    Tab(text: 'İlçelerimiz', icon: Icon(Icons.map)),
    Tab(text: 'Basında Biz', icon: Icon(Icons.fiber_new_sharp)),
    Tab(text: 'Program', icon: Icon(Icons.calendar_today)),
  ];

  List<Widget> ekranlar = [
    Anasayfa(),
    Ilcelerimiz(),
    BasindaBiz(),
    ProgramCetveli(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: sayfalar.length, vsync: this);
    _tabController.addListener(changeTitle);
  }

  void changeTitle() {
    setState(() {
      // get index of active tab & change current appbar title
      mainTitle = basliklar[_tabController.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(mainTitle),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: TabBar(
          controller: _tabController,
          tabs: sayfalar,
          isScrollable: true,
        ),
      ),
      body: TabBarView(controller: _tabController, children: ekranlar),
      floatingActionButton: MyFloatingActionButton(),
    );
  }
}
