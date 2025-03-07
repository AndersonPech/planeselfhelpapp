import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planestats/globals.dart';
import 'package:planestats/pages/helpQuotes.dart';
import 'package:planestats/pages/statistics.dart';

String aircraftData = '';
String airlineData = '';
Calculation calculation = Calculation();

class Beforeflight extends StatefulWidget {
  const Beforeflight({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BeforeflightState createState() => _BeforeflightState();
}

class _BeforeflightState extends State<Beforeflight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/beforeflightbg.png', // Replace with your background image
              fit: BoxFit.cover,
            ),
          ),
          Center(
            //Make a button that goes to before flight page
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                              fontFamily:
                                  GoogleFonts.deliciousHandrawn().fontFamily,
                            ),
                          ),

                          Text(
                            '(Note: This is an estimate. The calculation uses total number of incidents and number of total approximate flights by the aircraft. Newer aircraft may have a higher incident rate)',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: GoogleFonts.lexend().fontFamily,
                            ),
                          ),
                          AutocompleteAircraft(
                            onSelected: (String selection) {
                              Map plane = calculation.getAircraftData(
                                selection,
                              );
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
                              fontFamily: GoogleFonts.chewy().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Check your Airline Statistics',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                GoogleFonts.deliciousHandrawn().fontFamily,
                          ),
                        ),
                        Text(
                          '(Note: This is an estimate. The calculation uses total number of incidents and number of total approximate flights by the airline. Smaller airlines may have a higher incident rate)',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                          ),
                        ),

                        AutocompleteAirline(
                          onSelected: (String selection) {
                            Map plane = calculation.getAirlineData(selection);
                            setState(() {
                              if (plane['num_flights_until_crash'] == '0') {
                                airlineData =
                                    'This airline has never crashed! \n If we assume 1 crash for its total estimated flights, then it would be ${plane['num_flights']} flights until an incident.';
                              } else {
                                airlineData =
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
                            fontFamily: GoogleFonts.chewy().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Everyone needs some reassurance',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily:
                                GoogleFonts.deliciousHandrawn().fontFamily,
                          ),
                        ),
                        Text(
                          'A few collections of facts and quotes to make you feel better about your flight',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: GoogleFonts.lexend().fontFamily,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => HelpQuotes(),
                              ),
                            );
                          },
                          child: Text(
                            'Lets Go!',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily:
                                  GoogleFonts.deliciousHandrawn().fontFamily,
                              color: const Color.fromARGB(255, 110, 76, 97),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height / 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go Back'),
                ),
              ],
            ),
          ),
        ],
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
