import 'package:flutter/material.dart';

class Duringflight extends StatelessWidget {
  const Duringflight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //Make a button that goes to before flight page
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}