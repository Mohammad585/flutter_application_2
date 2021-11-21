import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/all_heros_page.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'U.N.I.S.H.F';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        
        theme: ThemeData(
          primarySwatch: Colors.lightGreen),
          
          home: MyHomePage(),
      ); 
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
   Widget build(BuildContext context) => Scaffold(
        
        body: AllHerosPage(),
      );
}
