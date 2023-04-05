import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

String message = "";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool seePassword = true;
  String classA = "";

  bool statusRememberMe = false;
  bool statusCampus = true;
  bool statusYoutube = false;
  bool statusOthers = false;
  String? gender;

  TextEditingController objText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'your username',
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 231, 9, 9)),
                    border: const OutlineInputBorder(gapPadding: 10),
                    suffixIcon: IconButton(
                        onPressed: () {
                          print("OK");
                        },
                        icon: const Icon(Icons.admin_panel_settings))),
              ),
              TextFormField(
                controller: objText,
                decoration: InputDecoration(
                  hintText: 'password',
                  labelText: 'password',
                  labelStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black26),
                  border: const OutlineInputBorder(gapPadding: 20),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          seePassword = !seePassword;
                          classA = objText.text;
                        });
                      },
                      icon: Icon(seePassword
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye)),
                ),
                obscureText: seePassword,
              ),
              CheckboxListTile(
                value: statusRememberMe,
                title: const Text("Remember Me!"),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (event) {
                  setState(() {
                    statusRememberMe = event!;
                  });
                },
              ),
              Text("Dari mana anda belajar Coding ?"),
              CheckboxListTile(
                value: statusCampus,
                title: const Text("Kampus"),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (event) {
                  setState(() {
                    statusCampus = event!;
                  });
                },
              ),
              CheckboxListTile(
                value: statusYoutube,
                title: const Text("Youtube"),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (event) {
                  setState(() {
                    statusYoutube = event!;
                  });
                },
              ),
              CheckboxListTile(
                value: statusOthers,
                title: const Text("Lainnya"),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (event) {
                  setState(() {
                    statusOthers = event!;
                    message = "Lainnya";
                  });
                },
              ),
              Text("Jenis Kelamin P/L"),
              RadioListTile(
                  value: "L",
                  title: Text("Laki-Laki"),
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                      print(gender);
                    });
                  }),
              RadioListTile(
                  value: "P",
                  title: Text("Perempuan"),
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                      print(gender);
                    });
                  }),
              ElevatedButton(
                  onPressed: () {
                    if (statusCampus & statusOthers & statusYoutube) {
                      print('Anda belejar di semua pilihan');
                    } else if (statusCampus & statusYoutube) {
                      print('Anda belejar di Kampus dan di Youtube');
                    } else if (statusCampus) {
                      print("Anda Hanya belajar di Kampus");
                    } else if (statusYoutube) {
                      print("Anda hanya belajar di YT");
                    } else {
                      print("Terserah elu dh");
                    }
                  },
                  child: Icon(Icons.save_outlined)),
              const DialogExample()
            ],
          ),
        ));
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('AlertDialog Title$message'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
