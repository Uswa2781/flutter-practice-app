

import 'package:crona_app/dashborad.dart';
import 'package:crona_app/practise.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    home: MyModel(),
    
    );

  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //  color: Colors.red,
             child: Stack(
              children: [
                Container(
                child: Image.asset('assets/back.png',)
                
                ),
                Positioned(
                  bottom: 0,
                  child: Container(height: 340, width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(25), topRight: Radius.circular(25)),
                    ),

                    child: Padding(
                      padding: const EdgeInsets. symmetric(vertical: 25,horizontal: 15),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text(" Be aware",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w400),),
                          SizedBox(height: 5,),
                          Text(" Stay healthy",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w400)),
                           SizedBox(height: 10,),
                          Text(" Welcome to COVID-19 information portal.",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black.withOpacity(0.7))),
                          SizedBox(height: 65,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            
                            Text("GET STARTED",style: TextStyle(fontSize: 15,
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.w700)),
                            SizedBox(width: 10,),
                            Container(
                              height: 70,width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff9156EC),
                                shape:BoxShape.circle
                               
                              ),
                              child: IconButton(onPressed: (){
                                Navigator.push(
                                    context,
                                MaterialPageRoute(builder: (context) => MyWidget()),
                                  );
                              }, icon: Icon(Icons.arrow_forward),color: Colors.white,),)
                          ],)
                        ],
                      ),
                    ),
                   
                    
                    ))
         
               
              ],
             ),

          ),
        ],
      ),
    );
  }
}
