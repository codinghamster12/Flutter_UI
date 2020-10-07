import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class LandingPage extends StatelessWidget {
  final _pageController= PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
     
      child: 
        SafeArea(
                  child: Stack(
            fit: StackFit.expand,
            children: [
              
              

              Image.asset('assets/nature.jpg', fit: BoxFit.cover),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              Container(
                  height:50,
                  width:50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0x080a0928)
                  ),
                  child: Padding (
                    padding: EdgeInsets.all(15.0),
                    child: SvgPicture.asset('assets/svg/icon_left_arrow.svg')),),
                    Container(
                  height:50,
                  width:50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0x080a0928)
                  ),
                  child: Padding (
                    padding: EdgeInsets.all(15.0),
                    child: SvgPicture.asset('assets/svg/icon_heart_fill.svg')),),



                  ],),
                )
              ],),
            Container(
              width: 400,
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 5,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xFFFFFFFF),
                        dotColor: Color(0xFFababab),
                        dotHeight:4.8,
                        dotWidth:6.0, 
                        spacing:4.8
                      )
                      
                    ),
                    Text('Raja Ampat',
                    style: TextStyle(fontFamily: 'PlayFairDisplay',
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white )),
                    SizedBox(height: 10,),
                    Text('The Hidden Place',
                    style: TextStyle(fontFamily: 'PlayFairDisplay',
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    color: Colors.white )),
                    SizedBox(height: 24),
                    Text('Raja Ampat is one of the favourite tourist destination, you can feel cultural tourism and history to explore exotic beaches in Raja Ampat.',
                    style: TextStyle(fontFamily: 'Lato',
                   
                    fontSize: 16,
                    color: Colors.white )),
                    SizedBox(height: 30),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('Start from',style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontSize: 16
                      )),
                      SizedBox(height: 10),
                      Text('\$130/person',style: TextStyle(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ))],),

                      Container(width: 170,
                      height: 60,
                    child: RaisedButton(onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child:Text('Explore now >>',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      fontSize: 18
                    ),),
                    color: Colors.white,
                    )
                    )

                    ]
                    )

                    
                  ],),
              ),)]),
        )),),);
  }
}