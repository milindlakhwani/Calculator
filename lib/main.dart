import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/calc_body.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var isDarkTheme = true;

  final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.orangeAccent[400],
    canvasColor: Color(0xFF283637),
  );
  final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    accentColor: Colors.orangeAccent[400],
    canvasColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: (isDarkTheme) ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Calculator",
            style: TextStyle(
              color: Colors.amberAccent[400],
              fontFamily: "Carter One",
              fontSize: 28,
            ),
          ),
          backgroundColor: (isDarkTheme) ? Colors.black12 : Colors.blueGrey,
          actions: [
            IconButton(
                color: Theme.of(context).primaryColorLight,
                icon:
                    (isDarkTheme) ? Icon(Icons.wb_sunny) : Icon(Icons.bedtime),
                onPressed: () {
                  setState(() {
                    if (isDarkTheme) {
                      isDarkTheme = false;
                    } else {
                      isDarkTheme = true;
                    }
                  });
                })
          ],
        ),
        body: CalcBody(isDarkTheme),
      ),
    );
  }
}
