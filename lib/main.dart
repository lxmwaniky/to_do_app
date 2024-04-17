import 'package:flutter/material.dart';

void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({Key? key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      );
    }
  }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text('You Pressed this many times'),
            ),
            Text(_count.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => _increment , child: const Icon(Icons.add),),
    );
  }
}