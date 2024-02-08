import 'package:flutter/material.dart';

import 'data.dart';

class view extends StatefulWidget {
  const view({super.key});

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  Widget build(BuildContext context) {
    data p = ModalRoute.of(context)!.settings.arguments as data;
    return Scaffold(
      appBar: AppBar(
          title: Text("${p.title}",
              style: TextStyle(fontFamily: "one", fontWeight: FontWeight.bold)),
          backgroundColor: Colors.deepOrange),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              width: 390,
              height: 250,
              child: Image.network(
                "${p.photoUrl}",
                fit: BoxFit.cover,
              )),
          ListTile(
            title: Text("${p.title}",
                style: TextStyle(fontSize: 25, fontFamily: "two")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "  ${p.totalTime} mins",
                style: TextStyle(fontSize: 20, fontFamily: "one"),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Icon(Icons.local_fire_department_sharp),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Icon(Icons.cleaning_services_sharp),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Icon(Icons.share),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Icon(Icons.pie_chart),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange.shade50,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Icon(Icons.print),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${p.calories}\nCalories",
                style: TextStyle(fontSize: 15, fontFamily: "one"),
              ),
              Text(
                "${p.servings}\nServings",
                style: TextStyle(fontSize: 15, fontFamily: "one"),
              ),
              Text(
                "share\nrecipe",
                style: TextStyle(fontSize: 15, fontFamily: "one"),
              ),
              Text(
                "Unit\ndirection",
                style: TextStyle(fontSize: 15, fontFamily: "one"),
              ),
              Text(
                "Print\nRecipe",
                style: TextStyle(fontSize: 15, fontFamily: "one"),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 300,
                color: Colors.deepOrange,
                alignment: Alignment.centerLeft,
                child: Text("  Ingredients",
                    style: TextStyle(fontSize: 25, fontFamily: "two")),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text("${p.ingredients}",
                style: TextStyle(fontSize: 15, fontFamily: "two")),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 300,
                color: Colors.deepOrange,
                alignment: Alignment.centerLeft,
                child: Text("  Direction",
                    style: TextStyle(fontSize: 25, fontFamily: "two")),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text("${p.directions}",
                style: TextStyle(fontSize: 15, fontFamily: "two")),
          ),
        ]),
      ),
    );
  }
}
