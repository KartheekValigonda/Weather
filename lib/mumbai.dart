import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';
import 'package:weather/cities.dart';
import 'package:weather/common%20widgets/forecast_card.dart';

class Mumbai extends StatefulWidget{
  const Mumbai({super.key});

  @override
  State<Mumbai> createState() => _FirstState();
}

class _FirstState extends State<Mumbai> {

  bool isLoading = false;

  double temp = 0;
  int? humidity;
  int?pressure;
  double? speed;
  String? desc;
  String? time1;
  String? time2;
  String? time3;
  String? time4;
  String? time5;


  double temp1 = 0;
  double temp2 = 0;
  double temp3 = 0;
  double temp4 = 0;
  double temp5 = 0;


  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<void> getCurrentWeather() async{
    try{
      setState(() {
        isLoading = true;
      });
      final res = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=Mumbai&APPID=f905fe9e61013cb322bd4b6a6f940def'),);

      final data = jsonDecode(res.body);

      if(data['cod']!="200"){
        throw "An Unexpected error occurred";
      }

      setState(() {
        temp = data['list'][0]['main']['temp'] ;
        temp1 = data['list'][1]['main']['temp'] ;
        temp2 = data['list'][2]['main']['temp'] ;
        temp3 = data['list'][3]['main']['temp'] ;
        temp4 = data['list'][4]['main']['temp'] ;
        temp5 = data['list'][5]['main']['temp'] ;
        time1 = data['list'][2]['dt_txt'].split(' ')[1];;
        time2 = data['list'][3]['dt_txt'].split(' ')[1];;
        time3 = data['list'][4]['dt_txt'].split(' ')[1];;
        time4 = data['list'][5]['dt_txt'].split(' ')[1];;
        time5 = data['list'][6]['dt_txt'].split(' ')[1];
        humidity = data['list'][0]['main']['humidity'];
        pressure = data['list'][0]['main']['pressure'];
        speed = data['list'][0]['wind']['speed'];
        desc = data['list'][0]['weather'][0]['main'];
        isLoading = false;
      });

    }catch (e){
      throw e.toString();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFcaf0f8),
      drawer: Cities(),
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
        backgroundColor: Color(0xFF48cae4),
        actions: [
          IconButton(onPressed:(){}, icon: Icon(Icons.refresh))
        ],
      ),
      body: isLoading ? Center(child: const CircularProgressIndicator()):Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Mumbai", style: TextStyle(fontSize:22 ),),
              SizedBox(height: 10,),
              Material(
                elevation: 12,
                shadowColor: Colors.grey,
                borderRadius: BorderRadius.circular(21.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Color(0xFF00b4d8),Color(0xFF90e0ef), Color(0xFFcaf0f8)],),
                    borderRadius: BorderRadius.circular(21.0),
                  ),
                  child: Column(
                    children: [
                      Text("${(temp - 273.15).toStringAsFixed(2)} °C", style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          desc=='Clouds' || desc=='Rain'
                              ?Icons.cloud:Icons.sunny, size: 60,),
                      ),
                      Text("$desc", style: TextStyle(fontSize: 25),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text("Hourly Forecast", style: TextStyle(fontSize: 20),),
              SizedBox(height: 20,),

              SingleChildScrollView(
                scrollDirection:Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    forecastCard(
                        time: "$time1",
                        icon: Icons.cloud,
                        temp:  temp1,
                        height: context.screenHeight*0.2,
                        width: context.screenWidth*0.38
                    ),
                    forecastCard(
                        time: "$time2",
                        icon: Icons.cloud,
                        temp:  temp2,
                        height: context.screenHeight*0.2,
                        width: context.screenWidth*0.38
                    ),
                    forecastCard(
                        time: "$time3",
                        icon: Icons.cloud,
                        temp:  temp3,
                        height: context.screenHeight*0.2,
                        width: context.screenWidth*0.38
                    ),
                    forecastCard(
                        time: "$time4",
                        icon: Icons.cloud,
                        temp:  temp4,
                        height: context.screenHeight*0.2,
                        width: context.screenWidth*0.38
                    ),
                    forecastCard(
                        time: "$time5",
                        icon: Icons.cloud,
                        temp:  temp5,
                        height: context.screenHeight*0.2,
                        width: context.screenWidth*0.38
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text("Additional Information", style: TextStyle(fontSize: 20),),
              SizedBox(height: 15,),
              Row(
                children: [
                  Container(
                    padding:EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(Icons.water_drop, size:30,),
                        SizedBox(height: 10,),
                        Text("Humidity", style: TextStyle(fontSize:16 )),
                        SizedBox(height: 10,),
                        Text("$humidity %", style: TextStyle(fontSize:16 ),)
                      ],
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.wind, size:30,),
                        SizedBox(height: 10,),
                        Text("Wind Speed", style: TextStyle(fontSize:16 )),
                        SizedBox(height: 10,),
                        Text("$speed Kmph", style: TextStyle(fontSize:16 ),)
                      ],
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(CupertinoIcons.speedometer, size:30,),
                        SizedBox(height: 10,),
                        Text("Pressure", style: TextStyle(fontSize:16 )),
                        SizedBox(height: 10,),
                        Text("$pressure hpa", style: TextStyle(fontSize:16 ),)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


