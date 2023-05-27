import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff1A237E),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Rock Paper Scissors',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          backgroundColor: const Color(0xff1A237E),
        ),
        body: const RenderPhysicalShape(),
      ),
    );
  }
}

class RenderPhysicalShape extends StatefulWidget {
  const RenderPhysicalShape({super.key});

  @override
  State<RenderPhysicalShape> createState() => _RenderPhysicalShapeState();
}

class _RenderPhysicalShapeState extends State<RenderPhysicalShape> {
  int me = 3;
  int system = 1;
  List<Icon> icons = [];
  int yourScore = 0;
  int systemScore = 0;

  void random() {
    setState(() {
      system = Random().nextInt(3) + 1;
      me = Random().nextInt(3) + 1;
    });
  }

  String get getResult {
    String result = '';
    if (yourScore > systemScore) {
      result = 'You won';
    } else if (yourScore < systemScore) {
      result = 'You lost';
    } else if (yourScore == systemScore) {
      result = 'Draw';
    }
    return result;
  }

  addIcon() {
    if (me == system) {
      setState(() {
        icons.add(const Icon(Icons.handshake, color: Colors.yellow));
      });
    } else if (me == 1 && system == 3 ||
        me == 2 && system == 1 ||
        me == 3 && system == 2) {
      setState(() {
        icons.add(const Icon(Icons.thumb_up, color: Colors.green));
      });
      yourScore++;
    } else {
      setState(() {
        icons.add(const Icon(Icons.thumb_down, color: Colors.orange));
      });
      systemScore++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return icons.length < 12
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: icons.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: icons[index],
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      random();
                      addIcon();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        "images/$me.png",
                      ),
                    ),
                  )),
                  const Text(
                    'VS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("images/$system.png"),
                  )),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'You',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'System',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          )
        : AlertDialog(
            title: const Text(
              'Done',
              style: TextStyle(fontSize: 24),
            ),
            content: Row(
              children: [
                Text(
                  "$getResult $yourScore/12 ",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        icons.clear();
                        yourScore = 0;
                        systemScore = 0;
                      });
                    },
                    child: Text(
                      'Try Again',
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            ),
          );
  }
}
