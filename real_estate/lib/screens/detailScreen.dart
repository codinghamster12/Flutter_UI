import 'package:flutter/material.dart';
import 'package:real_estate/custom/OptionButton.dart';
import 'package:real_estate/custom/borderBox.dart';
import 'package:real_estate/utils/constants.dart';
import 'package:real_estate/utils/custom_functions.dart';
import 'package:real_estate/utils/widget_functions.dart';

class DetailPage extends StatelessWidget {
  final dynamic itemData;

  const DetailPage({Key key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size= MediaQuery.of(context).size;
    final double padding= 25.0;
    final ThemeData themeData = Theme.of(context);
    final sidePadding= EdgeInsets.symmetric(horizontal:padding);
    final allPadding= EdgeInsets.symmetric(horizontal: padding, vertical: padding);
    return SafeArea(
          child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
                      child: Stack(
                        children: [
    Column(
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
  
  
                  children: [
  
                    Stack(
  
                                    children: [
  
                                  Image.asset(itemData['image']),
  
  
  
  
  
        Padding(
  
            padding: allPadding,
  
            
  
            child: Row(
  
    
  
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    
  
                            children: [
  
                            
  
    
  
                              InkWell(
  
                                onTap:(){
  
                                   Navigator.pop(context);
  
  
  
                                },
  
  
  
                                                        child: BorderBox(
  
                                 
  
    
  
                                  width: 50,
  
    
  
                                  height:50, 
  
    
  
                                  child: Icon(Icons.keyboard_backspace, color: COLOR_BLACK)
  
    
  
                                ),
  
                              ),
  
    
  
                              BorderBox(
  
    
  
                                width: 50,
  
    
  
                                height:50, 
  
    
  
                                child: Icon(Icons.favorite_border, color: COLOR_BLACK)
  
    
  
                              ),
  
    
  
    
  
    
  
                            ],
  
    
  
                          ),
  
        ),
  
  ],
  
                    ),
  
                    addVerticalSpace(padding),
  
                    Padding(
  
                      padding: sidePadding,
  
  
  
                      child: Row(
  
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
  
  
                        children: [
  
                          Column(
  
                                                  crossAxisAlignment: CrossAxisAlignment.start,
  
  
  
                            children: [
  
                            Text('${formatCurrency(itemData['amount'])}', style:
  
                              themeData.textTheme.headline1
  
                            ),
  
                            Text('${itemData['address']}', style: themeData.textTheme.bodyText1)
  
  
  
                          ],),
  
                          BorderBox(
  
                            padding: const EdgeInsets.symmetric(horizontal:15, vertical:15),
  
                            child: Text('20 Hours ago' , style: themeData.textTheme.headline5)
  
                          )
  
                         
  
                        ],
  
                      ),
  
                      
  
                    ),
  
                    addVerticalSpace(padding),
  
                    Padding(
  
                      padding: sidePadding,
  
                      child: Text('House Information', style: themeData.textTheme.headline4),
  
                    ),
  
                    addVerticalSpace(padding),
  
                    SingleChildScrollView(
  
                      scrollDirection: Axis.horizontal,
  
                      physics: BouncingScrollPhysics(),
  
                                    child: Row(children: [
  
                        InformationTile(content: '${itemData['area']}', name:'Square foot'),
  
                        InformationTile(content: '${itemData['bedrooms']}', name:'Bedrooms'),
  
                        InformationTile(content: '${itemData['bathrooms']}', name:'Bathrooms'),
  
                        InformationTile(content: '${itemData['garage']}', name:'Garage'),
  
  
  
                        
  
  
  
                      ],),
  
                    ),
  
                    addVerticalSpace(padding),
  
  
  
                    Padding(
  
                      padding: sidePadding,
  
                      child: Text('${itemData['description']}', textAlign: TextAlign.justify,style: themeData.textTheme.bodyText2),
  
                    )
  
                  ],),
                  Positioned(
                    bottom:20,
                    width: size.width,
                                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      OptionButton(icon:Icons.message, text:"Message", width: size.width *0.35),
                      addHorizontalSpace(10),
                      OptionButton(icon:Icons.call, text:"Call", width: size.width *0.35),

                    ],),
                  )
],
            ),
          )


          )),
    );
  }
}
class InformationTile extends StatelessWidget {

  final String content;
  final String name;

  const InformationTile({Key key, this.content, this.name}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  final ThemeData themeData = Theme.of(context);
  final Size size= MediaQuery.of(context).size;
  final double tileSize= size.width * 0.20;
    return Container(
      margin: const EdgeInsets.only(left:25.0),
      child:Column(
        children: [
          BorderBox(
            width: tileSize,
            height: tileSize,
            child: Text(content, style: themeData.textTheme.headline3)
          ),
          addVerticalSpace(15),
          Text(name, style: themeData.textTheme.headline6)
        ],
      )
      
      
    );
  }
}

