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

  void random() {
    setState(() {
      system = Random().nextInt(3) + 1;
      me = Random().nextInt(3) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: random,
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
    );
  }
}
