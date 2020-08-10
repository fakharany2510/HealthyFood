import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailspage.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: [
          Padding(
            padding:EdgeInsets.only(top: 15.0 , left: 10.0),
            child:Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed:(){}, icon: Icon(Icons.arrow_back_ios),  color: Colors.white),
                Container(
                  width:125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.filter_list),  color: Colors.white),
                      IconButton(onPressed: (){}, icon: Icon(Icons.menu) , color: Colors.white),
                    ],
                  ),
                )
            ],
          ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child:Row(
              children: [
                Text(
                  'Healthy',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color:  Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Food',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25.0,
                    color:  Colors.white,
                  ),
                ),
              ],
            ),
          ),
         SizedBox(height:40.0),
          Container(
              height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              color: Colors.white,
            ),
            child:ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0 , right: 20.0),
              children: [
                Padding(
                  padding: EdgeInsets.only(top:45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: [
                        _buildfood('assets/plate1.png', 'Salmon bowl', '\$24'),
                        _buildfood('assets/plate2.png', 'Spring bowl', '\$13'),
                        _buildfood('assets/plate6.png', 'Avocado bowl', '\$34'),
                      ],
                    ),
                  ),
                ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                  children: [
                    Container(
                      width:56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                        border:Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                     child: Center(
                       child: Icon(Icons.search , color: Colors.black),
                     ),
                    ),
                    Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                          style: BorderStyle.solid
                        ),
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(
                        child: Icon(Icons.shopping_basket , color: Colors.black),
                      ),
                    ),
                    Container(
                      width: 120.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid,
                          width: 1.0
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFF21BFBD),
                      ),
                      child: Center(
                        child: Text(
                          'CheckOut',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}


Widget _buildfood(String imgPath , String foodName , String Price){
  return Padding(
    padding: EdgeInsets.only(top:10.0 , left: 10.0 , right: 10.0),
    child: InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder:(context)=> detailspage(heroTag: imgPath, foodName: foodName, foodPrice: Price),
        ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Hero(
                  tag: imgPath,
                  child: Image(
                   image: AssetImage(imgPath),
                   fit: BoxFit.cover,
                    height: 75.0,
                    width: 75.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 1.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodName,
                style:  TextStyle(
                  fontFamily: 'Montserrant',
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                Price,
                style:  TextStyle(
                  fontFamily: 'Montserrant',
                  fontSize: 15.0,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          SizedBox(width: 3),
          IconButton(
            icon: Icon(Icons.add),
            color:Colors.black,
            onPressed: (){},
          )
        ],
      ),
    ),

  );
}
