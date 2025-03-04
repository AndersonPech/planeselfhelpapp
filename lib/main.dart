import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:planestats/pages/statistics.dart';
import 'pages/beforeflight.dart' as beforeflight;
import 'pages/duringflight.dart' as duringflight;
import 'pages/afterflight.dart' as afterflight;
import 'pages/statistics.dart' as statistics;

void main() {
  runApp(const MyApp());
  Calculation().setAircraftData();
  Calculation().setAirlineData();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late GifController controller;

  @override
  void initState() {
    super.initState();
    controller = GifController(vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Gif(
            controller: controller,
            fps: 15,
            image: AssetImage('assets/images/blue.gif'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: ListView(
              shrinkWrap: true,
              // Make a button that goes to before flight page
              children: [
                SizedBox(
                  // Change the color of the text to white
                  child: Column(
                    children: [
                      Text(
                        'Welcome to the Flight Companion App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20), // Add spacing
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => beforeflight.Beforeflight(),
                            ),
                          );
                        },
                        child: Text(
                          'Before your flight',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(height: 20), // Add spacing
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => duringflight.Duringflight(),
                            ),
                          );
                        },
                        child: Text(
                          'During your flight',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
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
                        child: Text(
                          'After your flight',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
