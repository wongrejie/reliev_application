import 'package:flutter/material.dart';

import '../../models/user.dart';

class MentalInfoScreen extends StatefulWidget {
  final User user;
  const MentalInfoScreen({super.key, required this.user});

  @override
  State<MentalInfoScreen> createState() => _MentalInfoScreenState();
}

class _MentalInfoScreenState extends State<MentalInfoScreen> {
  var screenHeight, screenWidth, cardwidth;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      cardwidth = screenWidth;
    } else {
      cardwidth = 400.00;
    }
    return Scaffold(
      body: Center(
        child: Stack(children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Normal Screen.png'),
                      fit: BoxFit.cover))),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(" Mental health information",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(children: <Widget>[
                  SizedBox(
                    width: cardwidth,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 8,
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const Text("Depression",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 12,
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                minWidth: 115,
                                height: 50,
                                elevation: 10,
                                onPressed: null,
                                color: Theme.of(context).colorScheme.primary,
                                child: const Text(
                                  'Tell me more',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    width: cardwidth,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 8,
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const Text("Anxiety",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 12,
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                minWidth: 115,
                                height: 50,
                                elevation: 10,
                                onPressed: null,
                                color: Theme.of(context).colorScheme.primary,
                                child: const Text(
                                  'Tell me more',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    width: cardwidth,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 8,
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const Text("Stress",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 12,
                              ),
                              MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                minWidth: 115,
                                height: 50,
                                elevation: 10,
                                onPressed: null,
                                color: Theme.of(context).colorScheme.primary,
                                child: const Text(
                                  'Tell me more',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: _goHome,
                    child: const Text(
                      "Back",
                      style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          color: Colors.black),
                    ),
                  ),
                ])
              ],
            ),
          )
        ]),
      ),
    );
  }

  void _goHome() {
    Navigator.pop(context);
  }
}
