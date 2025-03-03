import 'package:flutter/material.dart';

class Beforeflight extends StatelessWidget {
  const Beforeflight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //Make a button that goes to before flight page
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Check your Aircraft Statistics',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text('Check the weather', style: TextStyle(fontSize: 20)),
                    Text('Check the aircraft', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Check your Airline Statistics',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text('Check the weather', style: TextStyle(fontSize: 20)),
                    Text('Check the aircraft', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
