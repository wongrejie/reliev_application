import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

import '../../models/user.dart';
import 'mainScreen.dart';

class ResultScreen extends StatefulWidget {
  final User user;
  final int depressionScore;
  final int anxietyScore;
  final int stressScore;
  final String depressionLevel;
  final String anxietyLevel;
  final String stressLevel;

  const ResultScreen(
      {super.key,
      required this.user,
      required this.depressionScore,
      required this.anxietyScore,
      required this.stressScore,
      required this.depressionLevel,
      required this.anxietyLevel,
      required this.stressLevel});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool useSides = true;
  double numberOfFeatures = 3;

  @override
  Widget build(BuildContext context) {
    const ticks = [7, 14, 21];
    var features = ["  Depression", " Stress", " Anxiety"];
    var data = [
      [widget.depressionScore, widget.stressScore, widget.anxietyScore],
    ];

    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();
    Color colorD, colorA, colorS;
    if (widget.depressionScore <= 4) {
      colorD = Colors.green;
    } else if (widget.depressionScore > 4 && widget.depressionScore <= 6) {
      colorD = const Color.fromARGB(255, 198, 253, 0);
    } else if (widget.depressionScore > 6 && widget.depressionScore <= 10) {
      colorD = const Color.fromARGB(255, 255, 119, 1);
    } else {
      colorD = Colors.red;
    }

    if (widget.anxietyScore <= 3) {
      colorA = Colors.green;
    } else if (widget.anxietyScore > 3 && widget.anxietyScore <= 5) {
      colorA = const Color.fromARGB(255, 198, 253, 0);
    } else if (widget.anxietyScore > 5 && widget.anxietyScore <= 7) {
      colorA = const Color.fromARGB(255, 255, 119, 1);
    } else {
      colorA = Colors.red;
    }

    if (widget.stressScore <= 7) {
      colorS = Colors.green;
    } else if (widget.stressScore > 7 && widget.stressScore <= 9) {
      colorS = const Color.fromARGB(255, 198, 253, 0);
    } else if (widget.stressScore > 9 && widget.stressScore <= 12) {
      colorS = const Color.fromARGB(255, 255, 119, 1);
    } else {
      colorS = Colors.red;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
        ),
        body: Stack(children: <Widget>[
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
            child: Column(
              children: [
                const SizedBox(height: 70),
                SizedBox(
                  width: 300,
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: RadarChart.light(
                          ticks: ticks,
                          features: features,
                          data: data,
                          reverseAxis: false,
                          useSides: useSides,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 8,
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [
                        const Text("Depression Score:"),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const SizedBox(width: 132),
                            Text(
                              widget.depressionScore.toString(),
                              style: TextStyle(
                                color: colorD,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(widget.depressionLevel,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold))
                          ],
                        ),
                        const Text("Anxiety Score:"),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const SizedBox(width: 132),
                            Text(
                              widget.anxietyScore.toString(),
                              style: TextStyle(
                                color: colorA,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(widget.anxietyLevel,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold))
                          ],
                        ),
                        const Text("Stress Score:"),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const SizedBox(width: 132),
                            Text(
                              widget.stressScore.toString(),
                              style: TextStyle(
                                color: colorS,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(widget.stressLevel,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold))
                          ],
                        ),
                      ]),
                    )),
                const SizedBox(
                  height: 12,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  minWidth: 115,
                  height: 50,
                  elevation: 10,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          title: const Text(
                            "Back to Home?",
                            style: TextStyle(),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                "Yes",
                                style: TextStyle(),
                              ),
                              onPressed: () {
                                _home();
                              },
                            ),
                            TextButton(
                              child: const Text(
                                "No",
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
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          )
        ]));
  }

  void _home() {
    User user = widget.user;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (content) => MainScreen(user: user)));
  }
}
