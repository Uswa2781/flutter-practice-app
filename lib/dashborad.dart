import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override

  List dget=[];
 
   var responsebody;
  bool loading=true;

   initState(){
    super.initState();
    getData();
  }

 
  getData()async{
    

    setState(() {
      loading=true;
    });
    var api="https://api.coronavirus.data.gov.uk/v1/data";

    var response= await http.get(Uri.parse(api),
    // headers: {
    //   'Content-Type': 'Application/json',
    // }
    );
    print(response.statusCode);
     print("body:${response.body}");

     if (response.statusCode==200){
      setState(() {
         responsebody=jsonDecode(response.body); 
         dget=responsebody['data'];
         log('$responsebody');
    
      
          
       });

       print('data: $responsebody');

      //  var type=responsebody['confirmed'];
      // var setup=data['setup'];
      // var punchline=data['punchline'];

     }
     else{
            print("Server Error! Please try again latter");
     }


   
    log("Api okay..");
      setState(() {
      loading=false;
    });
   

  }



  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //  height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Colors.red,
        child:SingleChildScrollView(
          child: Column(
            children: [
               
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                  child: Row(
                    children: [
                  CircleAvatar(
              backgroundImage: AssetImage("uswa.jpeg"),
                  radius: 30 //Text
              ),
                    ],
                  ),
                ),
            
                Container(height: MediaQuery.of(context).size.height*0.2,width: MediaQuery.of(context).size.width*1.0,
                child: Stack(
                  children: [
                    Container(
                    decoration: BoxDecoration(
                      color: Color(0xffCFE3FC),
                      borderRadius: BorderRadius.circular(30)
            
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    height:150,width: 440,
                    child: Column(
                      children: [
                       
                      ],
                    ),
                    
                    
                    ),
                    Positioned(
                      left: 30,
                      child: Image.asset("Design.png")),
                    Positioned(
                      right: 30,
                      top: 30,
                      child: Column(children: [Text("Know safety tips and \n precautions from \n top Doctors.",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                      SizedBox(height: 10,),
                       Container(
                        margin: EdgeInsets.only(right: 100),
                                height: 25,width: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xff9156EC),
                                  borderRadius: BorderRadius.circular(20)
                                 
                                ),
                                child: Icon(Icons.arrow_forward,color: Colors.white,))
               
          
                      ],))
                    
                    ],
                ),
                
                ),
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xffF49E6F)),
                  height: MediaQuery.of(context).size.height*0.06,width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    
                    children: [
                      SizedBox(width: 10,),
                      Container(height: 40,width: 200,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(30)),
                      child: Center(child: Text("Tracker",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))),
                      SizedBox(width: 40,),
                      
                      Text("Symptoms",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,
                      color: Color(0xffA74813)),)
                  
                    
                    
                  ],),
                  
                  ),
                  SizedBox(height: 30,),
                 loading==true?
                Text("loading Data.."):
            
                  Wrap(
                     direction: Axis.horizontal,
                     alignment: WrapAlignment.center,
                     spacing:20,
                    runSpacing: 15,
                    children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical:10,horizontal: 10),
                    
                        width: 180,
                       height: 120,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                        color: Colors.red.withOpacity(0.2)),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text("Confirmed",style: TextStyle(
                                fontSize: 19,fontWeight: FontWeight.w700,
                                color: Colors.red,))
                            ],),
                            SizedBox(height: 40,),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [ Text(responsebody['data'][0]['confirmed'].toString(),style: TextStyle(
                                fontSize: 25,fontWeight: FontWeight.w700,
                                color: Colors.red,)),],)
                          ],
                        ),
            
              
              
              ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical:10,horizontal: 10),
                        width: 180,
                       height: 120,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.withOpacity(0.2)),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text("Death",style: TextStyle(
                                fontSize: 19,fontWeight: FontWeight.w700,
                                color: Colors.blue,))
                            ],),
                            SizedBox(height: 40,),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [ Text(responsebody['data'][0]['death'].toString(),style: TextStyle(
                                fontSize: 25,fontWeight: FontWeight.w700,
                                color: Colors.blue,)),],)
                          ],
                        ),
            
              
              
              ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical:10,horizontal: 10),
                        width: 180,
                       height: 120,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                        color: Colors.green.withOpacity(0.2)),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text("Latest",style: TextStyle(
                                fontSize: 19,fontWeight: FontWeight.w700,
                                color: Colors.green,))
                            ],),
                            SizedBox(height: 40,),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [ Text(responsebody['data'][0]['latestBy'].toString(),style: TextStyle(
                                fontSize: 25,fontWeight: FontWeight.w700,
                                color: Colors.green,)),],)
                          ],
                        ),
            
              
              
              ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical:10,horizontal: 10),
                        width: 180,
                       height: 120,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.2)),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text("Total Death",style: TextStyle(
                                fontSize: 19,fontWeight: FontWeight.w700,
                                color: Colors.grey,))
                            ],),
                            SizedBox(height: 40,),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [ Text(responsebody['data'][0]['deathRate'].toString(),style: TextStyle(
                                fontSize: 25,fontWeight: FontWeight.w700,
                                color: Colors.grey,)),],)
                          ],
                        ),
            
              
              
              ),
            
                
            
                  ],),
                  Padding(
                    padding: const EdgeInsets.only(right: 300,top: 20),
                    child: Text("All Data",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 15,),
          
          
                       Container(height: 50,width: MediaQuery.of(context).size.width*0.9,
                      decoration: BoxDecoration(color: Color(0xffCFE3FC),borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
          
                            SizedBox(width: 8,),
                          Text("Date",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          SizedBox(width: 8,),
                        Text("Latest",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
                        SizedBox(width: 8,),
                       Text("Confirmed",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                       SizedBox(width: 8,),
                       Text("NewDeath",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
          
                       SizedBox(width: 8,),
                      Text("TotalDeath",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                        ],
                      ),
                      
                      ),
                      SizedBox(height: 10,),
                       loading==true?
                Text("loading Data.."):
                    Container(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: ListView.builder(
                      itemCount: dget.length,
                      itemBuilder: (context, i){
                        return  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          child: Container(height: 50,width: MediaQuery.of(context).size.width*0.9,
                      decoration: BoxDecoration(color: Color(0xffCFE3FC),borderRadius: BorderRadius.circular(30)),
                      child: Row(
                          children: [
          
                              SizedBox(width: 8,),
                            Text(responsebody['data'][i]['date'].toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                            SizedBox(width: 8,),
                          Text(responsebody['data'][i]['latestBy'].toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
                          SizedBox(width: 8,),
                       Text(responsebody['data'][i]['death'].toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                       SizedBox(width: 8,),
                       Text(responsebody['data'][i]['confirmed'].toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
          
                       SizedBox(width: 25,),
                      Text(responsebody['data'][i]['death'].toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          ],
                      ),
                      
                      ),
                        );
                      
                      // return Card(
                      //   color: Color.fromARGB(255, 211, 202, 202),
                      //   margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      //   child: ListTile(
                      //     leading:Text(responsebody['data'][i]['death'].toString()),
                          
                       
                          
                      
                      //   ),
                      //   );
                            
                       },
                      ),
                    ),
            
            
              
            
          ],),
        ),
      ),
    );
  }
}


