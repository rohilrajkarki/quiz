import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:quiz_me/components/appbar.dart';
import 'package:quiz_me/components/category.dart';
import 'package:quiz_me/components/sorting.dart';
import 'package:quiz_me/constants.dart';
import 'package:quiz_me/model/questions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.light, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.favorite, size: 30),
      Icon(Icons.settings, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return Scaffold(
        //bottom bar
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: IconThemeData(color: Colors.white70)),
          child: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: korange,
            color: kpurple,
            height: 60,
            items: items,
            index: index,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 350),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hi User",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  wordSpacing: 2.5),
                            ),
                            Text(
                              "Let's start the topics\nwhenever you are ready!",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  wordSpacing: 2.5),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: kpurple,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.asset("assets/images/profile.png"),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //sort
                    Sorting(),
                    const SizedBox(
                      height: 20,
                    ),
                    //Categories
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 16,
                              color: kpurple,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CatagoryList(),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
