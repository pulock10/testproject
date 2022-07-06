import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'designation_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DesignationModel> designationList = [];
  loadCountryNames() async{
    // var response = await http.get(Uri.parse("http://172.25.22.40:9002/api/parameter/jobtitles"),
    //     headers: {
    //       "Authorization":"Basic S2NWa1pYVGRaR0JrQUBQJTc1KjQyRzglWkZ4R1JHUFNyZER0OmVjcSt4NiVUdmRaWEMtdUFfcWd5QjlERnVAJCpYV0ZwYVM3VA=="
    //     }
    // );
    var formData = {
      "name":"abc",
      "password":"abc1234"
    };
    var response = await http.get(Uri.parse("http://172.25.22"
        ".40:9002/api/parameter/jobtitles"),
        headers: {
          "Authorization":"Basic S2NWa1pYVGRaR0JrQUBQJTc1KjQyRzglWkZ4R1JHUFNyZER0OmVjcSt4NiVUdmRaWEMtdUFfcWd5QjlERnVAJCpYV0ZwYVM3VA=="
        }
    );

    var body = jsonDecode(response.body);

    List responseData = body["listOfJobTitles"];

    for(var data in responseData){
      designationList.add(DesignationModel.convertFromJSON(data));
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Home"),
          leading: Icon(Icons.home),
          actions: [
            IconButton(
                onPressed: (){
                  loadCountryNames();
                },
                icon: const Icon(Icons.refresh)
            ),
            PopupMenuButton(
                itemBuilder: (ctx){
                  return ["About","Contact"].map((e) =>
                      PopupMenuItem(child: Text(e),)
                  ).toList();
                }
            )
          ]
      ),
      body: ListView(
        children: designationList.map((e) =>
            ListTile(title: Text(e.rankName),)
        ).toList(),
      ),
    );
  }
}
