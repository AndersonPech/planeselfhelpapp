import 'package:flutter/material.dart';
import 'pages/beforeflight.dart' as beforeflight;
import 'pages/duringflight.dart' as duringflight;
import 'pages/afterflight.dart' as afterflight;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(255, 180, 206, 227), // Start color
                  const Color.fromARGB(255, 96, 154, 255), // End color
                ],
              ),
            ),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                //Make a button that goes to before flight page
                children: [
                    SizedBox(
                    //Change the color of the text to white
                    child: Column(
                      children: [
                      Text(
                        'Welcome to the Flight Companion App',
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20), // Add spacing
                      ElevatedButton(
                        onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                          builder:
                            (context) => beforeflight.Beforeflight(),
                          ),
                        );
                        },
                        child: Text('Before your flight', style: TextStyle(color: Colors.blueAccent),),
                      ),
                      SizedBox(height: 20), // Add spacing
                      ElevatedButton(
                        onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                          builder:
                            (context) => duringflight.Duringflight(),
                          ),
                        );
                        },
                        child: Text('During your flight', style: TextStyle(color: Colors.blueAccent)),
                      ),
                      SizedBox(height: 20), // Add spacing
                      ElevatedButton(
                        onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                          builder: (context) => afterflight.Afterflight(),
                          ),
                        );
                        },
                        child: Text('After your flight',  style: TextStyle(color: Colors.blueAccent)),
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
