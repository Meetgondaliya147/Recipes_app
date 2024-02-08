import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes/view.dart';
import 'package:getwidget/getwidget.dart';
import 'data.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      "first": (context) => first(),
      "view": (context) => view(),
    },
    home: first(),
  ));
}
class first extends StatefulWidget {
  const first({super.key});
  @override
  State<first> createState() => _firstState();
}
class _firstState extends State<first> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  List l = [];
  @override
  final dio = Dio();
  Future getHttp() async {
    final response =
        await dio.get('https://api.sampleapis.com/recipes/recipes');
    l = response.data;
    // print(l);
    return l;
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "All Recipes Cookbook",
              style: TextStyle(fontFamily: "two"),
            ),
            backgroundColor: Colors.deepOrange),
        body: FutureBuilder(
          future: getHttp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: l.length,
                itemBuilder: (context, index) {
                  data s = data.fromJson(l[index]);
                  return InkWell(onTap: () {
                      Navigator.pushNamed(context,"view",arguments: s);
                    },
                    child: Card(
                      child: GFImageOverlay(
                        height: 300,
                        width: 300,
                        alignment: Alignment.center,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: Text('${s.title}', style:TextStyle(fontFamily: "two",fontSize: 30,color: GFColors.LIGHT)),
                          ),
                        ),
                        image: NetworkImage("${s.photoUrl}",),
                        colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.5),
                            BlendMode.darken),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                  child: Container(
                height: 500,
                width: 500,
                child: GFLoader(type: GFLoaderType.square),
              ));
            }
          },
        ));
  }
}
