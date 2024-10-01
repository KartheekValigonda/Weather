import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather/bangalore.dart';
import 'package:weather/chandigarh.dart';
import 'package:weather/chennai.dart';
import 'package:weather/delhi.dart';
import 'package:weather/hyderabad.dart';
import 'package:weather/kolkata.dart';
import 'package:weather/mumbai.dart';
import 'package:weather/pune.dart';

class Cities extends StatefulWidget {
  const Cities({super.key});

  @override
  State<Cities> createState() => _CitiesState();
}

class _CitiesState extends State<Cities> {

  var cities = ["Delhi", "Mumbai", "Bangalore","Pune", "Hyderabad","Kolkata", "Chandigarh", "Chennai"];
  var navcities=[
    const Delhi(),
    const Mumbai(),
    const Bangalore(),
    const Pune(),
    const Hyderabad(),
    const Kolkata(),
    const Chandigarh(),
    const Chennai(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFF90e0ef),
        height: context.screenHeight,
        width: context.screenWidth*0.7,
        child: Column(
          children: [
            Text("Cities", style: TextStyle(
              fontSize: 30
            ),),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: context.screenHeight*0.8,
                child: ListView.builder(
                  itemCount: cities.length,
                    itemBuilder:(context,index){
                    return InkWell(
                      hoverColor: Colors.white70,
                      onTap:(){},
                      child: ListTile(
                        title: Text(cities[index]),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>navcities[index]));
                        },
                      ),
                    );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
