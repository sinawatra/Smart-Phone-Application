
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertRecord() async {
    if(name.text=="" || age.text==""|| email.text=="" || password.text=="")
    {
      try{
        String uri = "http://10.0.84.45/practice_api/insert_record.php";
        var res = await http.post(Uri.parse(uri), body: {
          "name":name.text,
          "age":age.text,
          "email":email.text,
          "password":password.text
        });

        // ...

        var response = jsonDecode(res.body);
        if(response["success"]== 'true'){
          print("Record Inserted");
        }
        else {
          print("Some errors");
        }
        }
       catch(e) {
          print(e);
      }

    }
    else {
      print("Please Fill all Fields");
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Insert Record'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Name',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your age',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Email',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the Password',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                 insertRecord();
                },
                child: const Text('Insert the record'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  