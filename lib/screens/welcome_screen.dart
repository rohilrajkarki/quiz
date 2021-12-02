import 'package:flutter/material.dart';
import 'package:quiz_me/constants.dart';
import 'package:quiz_me/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kblue,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                      )),
                  child: Column(
                    //test here by removing column
                    children: [
                      Expanded(
                        child: Image.asset("assets/images/welcome.png"),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: kblue,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "Learning everything",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Learn with us when ever\nwhere ever you are!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black54,
                                height: 1.5,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                wordSpacing: 2.5),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Row(
                            //alignment
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                color: kpurple,
                                height: 60,
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
