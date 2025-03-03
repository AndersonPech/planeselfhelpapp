import 'package:flutter/material.dart';

class Afterflight extends StatelessWidget {
  const Afterflight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //Make a button that goes to before flight page
        child: 
        Card(
          child: Column(
            children: [
              ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      )
    );
  }
}