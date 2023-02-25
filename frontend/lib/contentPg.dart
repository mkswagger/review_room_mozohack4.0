import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'homeScreen.dart';

class Contents extends StatefulWidget {
  const Contents({super.key});

  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  // final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3C0E4E),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 102, 37, 128),
          title: Text(
            "I Phone 14 pro",
            style:
                TextStyle(fontFamily: "work_Sans", fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  //alignment: Alignment.bottomRight,
                  color: Color(0xfff7e930),
                  // height: MediaQuery.of(context).size.height * 0.3,
                  // width: MediaQuery.of(context).size.width * 0.8,
                  child: Image.asset("asset/iphone.jpg"),
                ),
                //Image.asset("asset/graph.jpg"),
                Image.asset("asset/amazonstarreview.jpg"),
                Image.asset("asset/reviewbystars.jpg"),
                Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Based on our AI \nThis product is worth buying.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromARGB(255, 38, 41, 138),
                          fontFamily: "work_Sans",
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
