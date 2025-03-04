import 'package:flutter/material.dart';
import 'package:planestats/globals.dart';
import 'package:planestats/pages/statistics.dart';

String aircraftData = '';
String airlineData = '';
Calculation calculation = Calculation();

class Beforeflight extends StatefulWidget {
  const Beforeflight({super.key});

  @override
  _BeforeflightState createState() => _BeforeflightState();
}

class _BeforeflightState extends State<Beforeflight> {
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
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Check your Aircraft Statistics',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Select your aircraft:\n (Note: The calculation takes into account number of incidents and number of total approximate flights by the aircraft. Newer aircraft may have a higher incident rate)',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      AutocompleteAircraft(
                        onSelected: (String selection) {
                          Map plane = calculation.getAircraftData(selection);
                          setState(() {
                            if (plane['num_flights_until_crash'] == '0') {
                              aircraftData =
                                  'This aircraft has never crashed! \n If we assume 1 crash for its total estimated flights, then it would be ${plane['num_flights']} flights until an incident.';
                            } else {
                              aircraftData =
                                  'The estimated number of flights until a major incident: ${plane['num_flights_until_crash']}';
                            }
                          });
                        },
                      ),
                      Text(
                        aircraftData,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    AutocompleteAirline(
                      onSelected: (String selection) {
                        Map plane = calculation.getAirlineData(selection);
                        setState(() {
                          if (plane['num_flights_until_crash'] == '0') {
                            airlineData =
                                'This airline has never crashed! \n If we assume 1 crash for its total estimated flights, then it would be ${plane['num_flights']} flights until an incident.';
                          } else {
                            airlineData=
                                'The estimated number of flights until a major incident: ${plane['num_flights_until_crash']}';
                          }
                        });
                      },
                    ),
                    Text(
                      airlineData,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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

class AutocompleteAircraft extends StatelessWidget {
  final Function(String) onSelected;

  AutocompleteAircraft({super.key, required this.onSelected});

  final List<String> _kOptions = aircraftMap.keys.toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return _kOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: onSelected,
      ),
    );
  }
}

class AutocompleteAirline extends StatelessWidget {
  final Function(String) onSelected;

  AutocompleteAirline({super.key, required this.onSelected});

  final List<String> _kOptions = airlineMap.keys.toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return _kOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: onSelected,
      ),
    );
  }
}
