import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bola Mágica',
      home: BolaMagica(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BolaMagica extends StatefulWidget {
  const BolaMagica({Key? key});

  @override
  State<BolaMagica> createState() => _BolaMagicaState();
}

class _BolaMagicaState extends State<BolaMagica> {
  int imagemIndex = 0;
  List<String> imagens = [
    'assets/ball1.png',
    'assets/ball2.png',
    'assets/ball3.png',
    'assets/ball4.png',
    'assets/ball5.png',
  ];

  void _responder() {
    setState(() {
      imagemIndex = Random().nextInt(imagens.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bola Mágica',
          style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
            color: Colors.white, 
          ),
        ),
        centerTitle: true, 
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue, 
              Colors.purple, 
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _responder,
                child: Transform.scale(
                  scale: 1.5,
                  child: Image.asset(
                    imagens[imagemIndex],
                    width: 200.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
