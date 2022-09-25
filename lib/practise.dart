import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class MyModel extends StatefulWidget {
  const MyModel({super.key});

  @override
  State<MyModel> createState() => _MyModelState();
}

class _MyModelState extends State<MyModel> {
  @override
  var data;
  List <cronaModel>cronaList=[];
  bool loading=false;

   initState(){
    super.initState();
    getData();
  }


  getData() async {
    setState(() {
      loading = true;
    });
    final responce = await http.get(
        Uri.parse('https://api.coronavirus.data.gov.uk/v1/data'));
    log(responce.statusCode.toString());
    if (responce.statusCode == 200) {
      data = jsonDecode(responce.body);
       cronaList=data['data'].tolist();

      for (int i = 0; i < cronaList.length; i++) {
        cronaModel caseModel = cronaModel(
          confirmedCase: data[i]['confirmed'].toString(),
          deathCase: data[i]['deathRate'].toString(),
          latestCase: data[i]['latestBy'].toString(),
          totalDeath: data[i]['death'].toString(),
        );
      cronaList.add(caseModel);
      }
      setState(() {
        loading = false;
      });
    }
  }




 
  



  
  Widget build(BuildContext context) {
    return Scaffold(
         body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
              loading == true
                  ? Text("Loading...")
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: cronaList.length,
                      itemBuilder: (context, i) {
                        return Text(cronaList[i].confirmedCase.toString());
                      },
                    ),
                   
            ],
          ),
        ),
      ),
    );
  }
}


//Model
class cronaModel{

  String confirmedCase ='';
  String latestCase ='';
  String  deathCase='';
  String totalDeath='';

  cronaModel({

   required this.confirmedCase,
    required this.latestCase,
    required this.deathCase,
    required this.totalDeath,
});


}