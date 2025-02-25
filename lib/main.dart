import 'package:finance_app/pages/activity.dart';
import 'package:finance_app/pages/home.dart';
import 'package:finance_app/pages/my_card.dart';
import 'package:finance_app/pages/profile.dart';
import 'package:finance_app/pages/scan.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0 ;
  @override

  final List<Widget> pages =[
    Home(),
    const MyCardPage(),
    const ScanPage(),
    const ActivityPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar:  BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tabItem(Icons.home, "Home", 0 ),
            tabItem(Icons.credit_card, "MyCard", 1 ),
            FloatingActionButton(
              onPressed: () => onTabTapped(2),
              backgroundColor: const Color.fromARGB(255, 16, 80, 98),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.qr_code_scanner, color: Colors.white),
            ),

            tabItem(Icons.bar_chart, "Activity", 3 ),
            tabItem(Icons.person, "Profile", 4 ),

          ],
        ),
      ),
    );
  }
  Widget tabItem(IconData icon, String label, int index){
    return IconButton(
        onPressed: () => onTabTapped(index),
        icon: Column(
          children: [
            Icon(icon,
            color: currentIndex == index?Colors.black: Colors.grey,),
            Text(label, style: TextStyle(
                fontSize: 10,
                color: currentIndex == index?Theme.of(context).primaryColor:Colors.grey),)
          ],
        )
    );

  }
  void onTabTapped(int index){
    setState(() {
      currentIndex = index;
    });
  }
}


