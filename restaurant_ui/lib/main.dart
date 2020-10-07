import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

var bannerItems= [
  "Burger", 
  "Cheese Chilly",
  "Noodles",
  "Pizza"
];
var bannerImages=[
 'images/burger.jpg',
 'images/cheese_chilly.jpg',
 'images/noodles.jpg',
 'images/pizza.jpg'
];
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
            width: screenWidth,
            height: screenHeight,
            child: SafeArea(
                child: SingleChildScrollView(
                  child:
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(icon: Icon(Icons.menu), onPressed: () {}),
                        Text('Foodies', style: TextStyle(fontSize: 50,
                        fontFamily: 'Samantha')),
                        IconButton(icon: Icon(Icons.person), onPressed: () {}),
                      ],
                    ),
                  ),
                  BannerWidgetArea(),
                  Container(
                    child: FutureBuilder(builder: (context, snapshot){
                      if(snapshot.hasData){
                        return Padding(padding: null)
                      }
                    })
                  )
                 
                ],
              ),
            ))));
  }
}

class BannerWidgetArea extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var screenHeight= MediaQuery.of(context).size.height;
    var screenWidth= MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items= new List<Widget>();
      String dataString= await DefaultAssetBundle.of(context).loadString('assets/data.json');
      List<dynamic> dataJSON= jsonDecode(dataString);
      dataJSON.forEach((object) { 
        items.add(Padding(padding: EdgeInsets.all(2.0) ,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius:2.0,
              blurRadius: 5.0
            )],
          ),
          child: 
        Row(

          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child:Image.asset(object['placeImage'], width:80, height: 80, fit: BoxFit.cover)
            )
          ],),)));
      });
          }
    PageController controller= PageController(initialPage: 1);
    List<Widget> banners= new List<Widget>();
    for(int i=0; i<bannerItems.length; i++){
      var bannerView= 
      Padding(
        padding: EdgeInsets.all(10),
        child: Container(
        child: Stack(
          fit: StackFit.expand,
          children:[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)
                ),
                boxShadow:[
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 5.0,
                    spreadRadius: 1.0
                  )
                ]
              )
              ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.asset(bannerImages[i], fit: BoxFit.cover)),
          
          Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black]
            )
          ),),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bannerItems[i],style: TextStyle(fontSize: 25,
              color: Colors.white)),
              Text('More than 40% Off', style: TextStyle(
                fontSize: 12,
                color: Colors.white
              ))
            ],),
          )
          ]
        ),

      ));
      
      banners.add(bannerView);
    }

    return Container(
      width: screenWidth,
      height: screenWidth * 9/16,
      child:PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,)
      
      
    );
  }
}
