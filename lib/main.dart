import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'foodpage.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GridPlace(),
    );
  }
}

class GridPlace extends StatefulWidget {
  const GridPlace({Key? key}) : super(key: key);

  @override
  _GridPlaceState createState() => _GridPlaceState();
}

int idx = -1;

class _GridPlaceState extends State<GridPlace> {
  @override
  Widget build(BuildContext context) {
    List<String> foodItems = [
      "Curry_Rice",
      "Curry_Roti_Rice",
      "Dal_Rice",
      "Dal_Roti",
      "Sabji_Dal_Rice",
      "Sabji_Dal_Roti_Rice",
      "Sabji_Dal_Roti",
      "Sabji_Roti"
    ];

    double h = MediaQuery.of(context).size.height;

    // return TextStyle();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // const Text("HELLO THERE "),
            Container(
              margin: EdgeInsets.only(bottom: 3.4 * h / 5),
              padding: EdgeInsets.only(top:h/25),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:[Color.fromRGBO(252,203,194,1),Color.fromRGBO(251,214,162,1),]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  const Text(
                    "How does your Dinner",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                  const Text("look like?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                 
                  Container(height: h/80),
                  const Text("(Excluding salad,curd and sides)"),
                  Container(height: h/80),
                  const Text("Select any one or more plates",
                      style: TextStyle(color: Colors.black54),),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: h * 3.4 / 5,
                    child: GridView.builder(
                      itemCount: foodItems.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        String food = foodItems[index];
                        return Container(
                          // color: Colors.red,
                          // padding: const EdgeInsets.all(10),
                          // margin: const EdgeInsets.only(top:10),
                          child: GestureDetector(
                            onTap: () {
                              // print("hello");
                              if (idx == index) {
                                idx = -1;
                              } else {
                                idx = index;
                              }
                              print(idx);
                              setState(() {});
                            },
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Container(
                                margin: const EdgeInsets.all(22),
                                decoration: (index == idx)
                                    ? const BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
                                        boxShadow: [
                                            BoxShadow(
                                              color: Colors.orange,
                                              blurRadius:
                                                  8.0, // soften the shadow
                                              spreadRadius:
                                                  5.0, //extend the shadow
                                            )
                                          ])
                                    : BoxDecoration(),
                              ),
                              Hero(
                                tag: food,
                                child: Image.asset("assets/images/$food.png"),
                              ),
                            ]),
                          ),
                        );
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        // crossAxisSpacing: 5,
                        crossAxisCount: 2,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: h / 14,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.end,
                            // crossAxisAlignment: CrossAxisAlignment.,
                            children: [
                              Icon(Icons.arrow_back_ios,
                                  size: 25, color: Colors.grey),
                              Text(
                                "Back",
                                style:
                                    TextStyle(fontSize: 22, color: Colors.grey),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  if (idx != -1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FoodPage(foodItems[idx])));
                                  }
                                },
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: (idx == -1)
                                          ? Colors.grey
                                          : Colors.black),
                                ),
                              ),
                              //  Text("Next",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 22,
                                color: (idx == -1) ? Colors.grey : Colors.black,
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
