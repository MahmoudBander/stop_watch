// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: CounterDownApp(),
    );
  }
}

class CounterDownApp extends StatefulWidget {
  const CounterDownApp({super.key});

  @override
  State<CounterDownApp> createState() => _CounterDownAppState();
}

class _CounterDownAppState extends State<CounterDownApp> {
  Timer? repeatedFunction;
  Duration duration = Duration(seconds: 0);
  startTimer() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int newSeconds = duration.inSeconds + 1;
        duration = Duration(seconds: newSeconds);
      });
    });
  }

  bool isRuning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        duration.inHours.toString().padLeft(2, "0"),
                        style: TextStyle(
                          fontSize: 80,
                        ),
                      ),
                    ),
                    Text(
                      "Hours",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 22,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        duration.inMinutes
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(
                          fontSize: 80,
                        ),
                      ),
                    ),
                    Text(
                      "Minutes",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 22,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        duration.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(
                          fontSize: 80,
                        ),
                      ),
                    ),
                    Text(
                      "seconds",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            isRuning
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (repeatedFunction!.isActive) {
                            setState(() {
                              repeatedFunction!.cancel();
                            });
                          } else {
                            startTimer();
                          }
                        },
                        child: Text(
                          (repeatedFunction!.isActive)
                              ? "STOP TIMER"
                              : "REsume",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 241, 89, 78)),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(14.0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)))),
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          repeatedFunction!.cancel();
                          setState(() {
                            duration = Duration(seconds: 0);
                            isRuning = false;
                          });
                        },
                        child: Text(
                          "CANCEL",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 241, 89, 78)),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(14.0)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)))),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      startTimer();
                      setState(() {
                        isRuning = true;
                      });
                    },
                    child: Text(
                      "Start Timer",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 25, 120, 197)),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(14.0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)))),
                  )
          ],
        ),
      ),
    );
  }
}
