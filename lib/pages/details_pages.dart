import 'package:flutter/material.dart';

class DetailsPages extends StatelessWidget {
   DetailsPages({super.key,required this.name});
  String name;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Detials"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
