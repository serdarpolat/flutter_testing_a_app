import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var _formKey = GlobalKey<FormState>();
  var isim = TextEditingController();
  var soyisim = TextEditingController();
  var mesaj = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Abdullah AKTAŞ"),
            accountEmail: Text("İl Başkanı"),
            currentAccountPicture: CircleAvatar(
              // backgroundImage: AssetImage("assets/images/reis.jpg"),
              backgroundColor: Colors.grey,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "Başkana Yaz",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: isim,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Örn.Ahmet",
                            labelText: "İsim",
                          ),
                          maxLength: 15,
                        ),
                        TextFormField(
                          controller: soyisim,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Örn.Yılmaz",
                            labelText: "Soyisim",
                          ),
                          maxLength: 15,
                        ),
                        TextFormField(
                          controller: mesaj,
                          decoration: InputDecoration(
                              icon: Icon(Icons.message),
                              hintText: "Üye olmak istiyorum..",
                              labelText: "Mesajınız"),
                          maxLines: 3,
                          maxLength: 150,
                        ),
                        MaterialButton(
                            color: Colors.red,
                            onPressed: () {},
                            child: Text("Gönder")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
