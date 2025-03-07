import 'package:flutter/material.dart';
import 'package:planestats/pages/statistics.dart';
import 'pages/beforeflight.dart' as beforeflight;
import 'pages/duringflight.dart' as duringflight;
import 'pages/afterflight.dart' as afterflight;
import 'package:google_fonts/google_fonts.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  // ignore: unused_field
  late Future<void> _dataFuture;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();

    // Load data asynchronously
    _dataFuture = _loadData();
  }

  Future<void> _loadData() async {
    await Calculation().setAircraftData();
    await Calculation().setAirlineData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/main.png'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: Text(
                      'A better flyer!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.chewy().fontFamily,
                        height: 1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  FadeTransition(
                    opacity: _animation,
                    child: Text(
                      'One flight at a time!',
                      style: TextStyle(
                        color: Colors.black,
                        height: 5,
                        fontSize: 15,
                        fontFamily: GoogleFonts.chewy().fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => beforeflight.Beforeflight(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/before_icon.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            'Before your flight',
                            style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: GoogleFonts.chewy().fontFamily),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => duringflight.Duringflight(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/during_icon.png'),
                        fit: BoxFit.cover,
                        opacity: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            'During your flight',
                            style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: GoogleFonts.chewy().fontFamily),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => afterflight.Afterflight(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/after_icon.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            'After your flight',
                            style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: GoogleFonts.chewy().fontFamily),
                          ),
                        ],
                      ),
                    ),
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
