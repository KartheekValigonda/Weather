import 'package:flutter/material.dart';


Widget forecastCard({time, icon, double? temp,height, width}){
return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        gradient: LinearGradient(colors:[Color(0xFF00b4d8),Color(0xFF90e0ef), Color(0xFFcaf0f8)],),
      borderRadius: BorderRadius.circular(13)
    ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(time, style: TextStyle(fontSize: 25),),
      Icon(icon,size: 25,),
      Text("${(temp! - 273.15).toStringAsFixed(2)}°C", style: TextStyle(fontSize: 25),)
    ],
  ),
  ),
);
}