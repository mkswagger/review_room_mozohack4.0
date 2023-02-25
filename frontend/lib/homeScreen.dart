// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'mainScreen.dart';
//library Home;
export "package:mozo_hack/homeScreen.dart";
import 'contentPg.dart';
import 'searchPg.dart';
import 'accountPg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  final screens = [Home(), Search(), Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 41, 138),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        backgroundColor: Color.fromARGB(255, 38, 41, 138),
        selectedItemColor: Color(0xfff7e930),
        iconSize: 33,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Color.fromARGB(255, 38, 41, 138)),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: "Profile",
          )
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Goodbye to scouring multiple websites for reviews.\n \nHello to a one-stop-shop for all your review needs. \n\nIntroducing The Review Room!",
            style: TextStyle(
              color: Color(0xfff7e930),
              fontFamily: 'work_Sans',
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "Try it out!!",
            style: TextStyle(
              color: Color(0xfff7e930),
              fontFamily: 'work_Sans',
              fontSize: 40,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xfff7e930),
                  suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Contents()));
                      },
                      icon: Icon(Icons.search)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  label: Text("Search"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
