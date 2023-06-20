import 'package:flutter/material.dart';
import 'package:newsappcourse/pages/busniess.dart';
import 'package:newsappcourse/pages/entertainment.dart';
import 'package:newsappcourse/pages/health.dart';
import 'package:newsappcourse/pages/sciencs.dart';

import 'pages/sports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home:  const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme:  ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.blueGrey.shade900,),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex=0;

   List screens=[businesspage(),sports(),healthpage(),sciencepage(),entertainmentpage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,

            title: const Text('News',
            style: TextStyle(fontSize: 20),),
        ),
         body:screens[currentIndex],
            bottomNavigationBar:BottomNavigationBar(
              iconSize: 30,
              backgroundColor: Colors.blueGrey.shade900,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.white,
              onTap: (index){
                setState(() {
                  currentIndex=index;
                });
              },
              currentIndex: currentIndex,
              type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            label: "business",
            icon: Icon(Icons.business),

          ),
          BottomNavigationBarItem(
            label: "sports",
            icon: Icon(Icons.directions_run),
          ),
          BottomNavigationBarItem(
            label: "health",
            icon: Icon(Icons.health_and_safety),
          ),
          BottomNavigationBarItem(
            label: "sciencs",
            icon: Icon(Icons.science),
          ),

          BottomNavigationBarItem(
            label: "entertainment",
            icon: Icon(Icons.tv),
          ),
        ],
      ),
    );
  }


}
