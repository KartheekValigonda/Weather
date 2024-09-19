import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/chandigarh.dart';
import 'package:weather/delhi.dart';
import 'package:weather/hyderabad.dart';

class Btmnav extends StatefulWidget {
  const Btmnav({super.key});

  @override
  State<Btmnav> createState() => _BtmnavState();
}

class _BtmnavState extends State<Btmnav> {

  int currIdx = 0;

  @override
  Widget build(BuildContext context) {

    // var currIdx = 0.obs;

    var navItem = [
      BottomNavigationBarItem(icon: Icon(Icons.location_city), label: "DEL"),
      BottomNavigationBarItem(icon: Icon(Icons.location_city), label: "CHD"),
      BottomNavigationBarItem(icon: Icon(Icons.location_city), label: "HYD")

    ];

    var navBody = [const Delhi(), const Chandigarh(), const Hyderabad()];

    return Scaffold(
      body: navBody.elementAt(currIdx),
      bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xFF067B6C),
          currentIndex: currIdx,
          selectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          items: navItem,
          onTap: (value){
            setState(() {
              currIdx = value;
            });
          },
        ),
    );
  }
}
