import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatefulWidget {
  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  var _formKey = GlobalKey<FormState>();
  var isim = TextEditingController();
  var soyisim = TextEditingController();
  var telNo = TextEditingController();
  var tcKimlikNo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      child: Icon(
        Icons.assignment,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/logo.png"),
                          backgroundColor: Colors.red,
                        ),
                        Text(""),
                        Text(
                          "Partimize Katılmak İçin",
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
                          controller: telNo,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Örn.5450000000",
                            labelText: "Telefon Numarası",
                          ),
                          maxLength: 10,
                        ),
                        TextFormField(
                          controller: tcKimlikNo,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: "Örn.11111111111",
                            labelText: "Tc Kimlik Numarası",
                          ),
                          maxLength: 11,
                        ),
                        MaterialButton(
                            color: Colors.red,
                            onPressed: () {},
                            child: Text("Üye Ol")),
                      ],
                    ),
                  ),
                ),
                actions: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.keyboard_return_sharp),
                  ),
                ],
              );
            });
      },
    );
  }
}
