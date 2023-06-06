import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:reliev_application/models/user.dart';
import 'package:reliev_application/screens/studentScreen/audioScreen.dart';
import 'package:reliev_application/screens/studentScreen/mentalhealthinfo.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'dass21Screen.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Center(
                child: Stack(children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Normal Screen.png'),
                      fit: BoxFit.cover))),
          Positioned.fill(
            child: FloatingBubbles.alwaysRepeating(
              noOfBubbles: 50,
              colorsOfBubbles: const [
                Colors.white,
                Colors.red,
              ],
              sizeFactor: 0.2,
              opacity: 60,
              speed: BubbleSpeed.slow,
              paintingStyle: PaintingStyle.fill,
              shape: BubbleShape.circle, //This is the default
            ),
          ),
          SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              const Text(" Greetings!",
                  style: TextStyle(
                      fontFamily: 'WinterSong',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.user.name.toString(),
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: cardwidth,
                    height: screenHeight / 5,
                    child: Card(
                        elevation: 8,
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/mental health.png'), // Replace with the path to your image file
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 14,
                              ),
                              const Text("Access Emotional Health Screening",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              WidgetAnimator(
                                atRestEffect: WidgetRestingEffects.wave(),
                                child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    minWidth: 115,
                                    height: 50,
                                    elevation: 10,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    child: const Text(
                                      'Get started',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25.0))),
                                            title: const Text(
                                              "Instructions:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            icon: WidgetAnimator(
                                              atRestEffect:
                                                  WidgetRestingEffects.pulse(),
                                              child: const Icon(
                                                Icons.perm_device_information,
                                                size: 50,
                                              ),
                                            ),
                                            content: const Text(
                                                "Please read each statement and choose the answer which indicates how much the statement applied to you OVER THE PAST WEEK.\n\nThere are no right or wrong answers. Do not spend too much time on any statement.",
                                                style: TextStyle()),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text(
                                                  "Start Test",
                                                  style: TextStyle(),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  _testUser();
                                                  setState(() {});
                                                },
                                              ),
                                              TextButton(
                                                child: const Text(
                                                  "Back",
                                                  style: TextStyle(),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: cardwidth,
                    height: screenHeight / 5,
                    child: Card(
                        elevation: 8,
                        margin: const EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/breathing.png'), // Replace with the path to your image file
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 14,
                              ),
                              const Text("Relieve your mind",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 20,
                              ),
                              WidgetAnimator(
                                atRestEffect: WidgetRestingEffects.wave(),
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  minWidth: 115,
                                  height: 50,
                                  elevation: 10,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0))),
                                          title: const Text(
                                            "Recommendation:",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          content: const Text(
                                              "Stay in a quite and distraction free zone and wearing earphone are recommended for better experience.",
                                              style: TextStyle()),
                                          icon: WidgetAnimator(
                                            atRestEffect:
                                                WidgetRestingEffects.pulse(),
                                            child: const Icon(
                                              Icons.headphones,
                                              size: 50,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text(
                                                "OK",
                                                style: TextStyle(),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                _audioScreen();
                                                setState(() {});
                                              },
                                            ),
                                            TextButton(
                                              child: const Text(
                                                "Back",
                                                style: TextStyle(),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  color: Theme.of(context).colorScheme.primary,
                                  child: const Text(
                                    'Breathing Exercises',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
            ]),
          ),
        ]))));
  }

  void _testUser() {
    User user = widget.user;
    Navigator.push(context,
        MaterialPageRoute(builder: (content) => DASS21Screen(user: user)));
  }

  void _mentalInfo() {
    User user = widget.user;
    Navigator.push(context,
        MaterialPageRoute(builder: (content) => MentalInfoScreen(user: user)));
  }

  void _audioScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (content) => const MusicPlayer()));
  }
}
