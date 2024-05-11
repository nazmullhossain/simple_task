import 'package:flutter/material.dart';
import 'package:selectbutton/pages/details_pages.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int selected=0;
  List<Map<String, dynamic>> selecor = [
    {
      "name": "nazmul",
      "age": "28",
    },
    {
      "name": "kamrul",
      "age": "28",
    },
    {
      "name": "parvez",
      "age": "28",
    }
  ];
 String name="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selector"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: selecor.length,
                  itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    selected=index;
                     name=selecor[index]["name"];

                    setState(() {

                    });
                    print(selecor[index]["name"]);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                      color:selected==index?Colors.red: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:
                    Column(
                      children: [
                        selected==index?  Icon(Icons.access_alarm):Container(),
                        Text("${selecor[index]["name"]}"),
                        Text("${selecor[index]["age"]}"),

                      ],
                    ),
                  ),
                );
              }),
            ),
           OutlinedButton(onPressed: (){
             if(name.isNotEmpty){
               Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsPages(name: name)));
             }
             else{
               Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsPages(name: "${selecor[0]["name"]}")));
             }
           }, child: Text("Naivagte"))

          ],
        ),
      ),
    );
  }
}
