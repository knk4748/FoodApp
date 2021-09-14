import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FoodPage extends StatefulWidget {
  String _pageTitle = "";

  FoodPage(String pageTitle, {Key? key}) : super(key: key) {
    _pageTitle = pageTitle;
  }

  @override
  // ignore: no_logic_in_create_state
  _FoodPageState createState() => _FoodPageState(_pageTitle);
}

class _FoodPageState extends State<FoodPage> {
  String _pageTitle = "";
  bool salad = false;
  bool soup = false;

  _FoodPageState(String pageTitle) {
    _pageTitle = pageTitle;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        // brgb(250,205,190)
        // backgroundColor: const Color.fromRGBO(250, 205, 190, 1),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(252, 203, 194, 1),
                    Color.fromRGBO(251, 214, 162, 1),
                  ]),
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Text(
                    "Select the side(s) you prefer with Dinner",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    // color: Colors.white,
                    margin: EdgeInsets.only(),
                    padding: EdgeInsets.only(top: h / 28, bottom: 3.6 * h / 8),
                    child: Hero(
                      tag: _pageTitle,
                      child: Image.asset("assets/images/$_pageTitle.png"),
                    ),
                    height: 6.3 * h / 8,
                    width: double.infinity,
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(bottom: h / 14),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            blurRadius: 8.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),

                    // color: Colors.white,
                    height: 2.7 * h / 8,
                    width: double.infinity,
                  )),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                bottom: (salad) ? 5.4 * h / 14 : 2 * h / 14,
                left: (salad) ? w / 18 : 0,
                child: AnimatedContainer(
                  // margin:EdgeInsets.only(left: 1),
                  width: (salad) ? 1.1 * w / 5 : w / 2,
                  duration: Duration(milliseconds: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //   // color: Colors.yellow, //background color of box

                        // ),
                        child: GestureDetector(
                          child: Image.asset("assets/images/Salad.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 2 * h / 14,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: (salad)
                              ? BoxDecoration(
                                  color:
                                      Colors.orange, //background color of box
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.orange,
                                      blurRadius: 8.0, // soften the shadow
                                      spreadRadius: 5.0, //extend the shadow
                                    )
                                  ],
                                )
                              : BoxDecoration(),
                          child: GestureDetector(
                              child: Image.asset("assets/images/Salad.png"),
                              onTap: () {
                                salad = !salad;
                                setState(() {});
                              })),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Any Salad",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              //SOUP
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                bottom: (soup) ? 8.5 * h / 14 : 2 * h / 14,
                right: (soup) ? w / 18 : 0,
                child: AnimatedContainer(
                  // margin:EdgeInsets.only(left: 1),
                  width: (soup) ? 1.1 * w / 5 : w / 2,
                  duration: const Duration(milliseconds: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //   // color: Colors.yellow, //background color of box

                        // ),
                        child: GestureDetector(
                          child: Image.asset("assets/images/Soup.png"),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 2 * h / 14,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: (soup)
                              ? BoxDecoration(
                                  color:
                                      Colors.orange, //background color of box
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.orange,
                                      blurRadius: 8.0, // soften the shadow
                                      spreadRadius: 5.0, //extend the shadow
                                    )
                                  ],
                                )
                              : BoxDecoration(),
                          child: GestureDetector(
                              child: Image.asset("assets/images/Soup.png"),
                              onTap: () {
                                soup = !soup;
                                setState(() {});
                              })),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Any Soup",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    height: h / 14,
                    color: Colors.white,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.,
                        children: [
                          Icon(Icons.arrow_back_ios,
                              size: 25, color: Colors.black),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Back",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                ),
                              )),
                          Spacer(),
                          Text(
                            (salad || soup) ? "Next" : "Skip",
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          //  Text("Next",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: (salad || soup) ? Colors.grey : Colors.black,
                          )
                        ],),
                  ),),
                  Positioned(
                    bottom: 2.8*h/8,
                    child: Center(child: Text("Sides",style: TextStyle(fontSize: 30),)))
            ],
          ),
        ),
      ),
    );
  }
}
