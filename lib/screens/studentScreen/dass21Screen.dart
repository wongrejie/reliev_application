import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:reliev_application/screens/studentScreen/counselorScreen.dart';
import 'package:reliev_application/screens/studentScreen/resultHistoryScreen.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../../models/user.dart';
import '../../shared/serverConfig.dart';
import 'resultScreen.dart';

class DASS21Screen extends StatefulWidget {
  final User user;
  const DASS21Screen({super.key, required this.user});

  @override
  _DASS21ScreenState createState() => _DASS21ScreenState();
}

class _DASS21ScreenState extends State<DASS21Screen> {
  final _formKey = GlobalKey<FormState>();
  int depressionScore = 0;
  int anxietyScore = 0;
  int stressScore = 0;
  int _depressionScore1 = 0;
  int _depressionScore2 = 0;
  int _depressionScore3 = 0;
  int _depressionScore4 = 0;
  int _depressionScore5 = 0;
  int _depressionScore6 = 0;
  int _depressionScore7 = 0;
  int _anxietyScore1 = 0;
  int _anxietyScore2 = 0;
  int _anxietyScore3 = 0;
  int _anxietyScore4 = 0;
  int _anxietyScore5 = 0;
  int _anxietyScore6 = 0;
  int _anxietyScore7 = 0;
  int _stressScore1 = 0;
  int _stressScore2 = 0;
  int _stressScore3 = 0;
  int _stressScore4 = 0;
  int _stressScore5 = 0;
  int _stressScore6 = 0;
  int _stressScore7 = 0;
  String depressionLevel = '';
  String anxietyLevel = '';
  String stressLevel = '';
  final List<String> values = [
    "Not at All",
    "Seldom",
    "Often",
    "Almost Always"
  ];
  int selectedIndex0 = 0;
  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  int selectedIndex3 = 0;
  int selectedIndex4 = 0;
  int selectedIndex5 = 0;
  int selectedIndex6 = 0;
  int selectedIndex7 = 0;
  int selectedIndex8 = 0;
  int selectedIndex9 = 0;
  int selectedIndex10 = 0;
  int selectedIndex11 = 0;
  int selectedIndex12 = 0;
  int selectedIndex13 = 0;
  int selectedIndex14 = 0;
  int selectedIndex15 = 0;
  int selectedIndex16 = 0;
  int selectedIndex17 = 0;
  int selectedIndex18 = 0;
  int selectedIndex19 = 0;
  int selectedIndex20 = 0;
  int selectedIndex21 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DASS-21'),
          actions: [
            WidgetAnimator(
              atRestEffect: WidgetRestingEffects.wave(),
              child: TextButton.icon(
                  onPressed: () => {_resultHistory()},
                  icon: const Icon(Icons.history, color: Colors.black),
                  label: const Text(
                    "Result History",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
        body: Stack(children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Normal Screen.png'),
                      fit: BoxFit.cover))),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "Please slide the slider to choose the answer which indicate:\n\n'Not at All', 'Seldom', 'Often', 'Almost Always'\n\nfor the statement that applied to you and click the submit button after answering all the questions.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex0.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex0]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex0 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "1. I found it hard to wind down.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex1.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex1]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex1 = value.toInt();
                                                _stressScore1 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "2. I was aware of dryness of my mouth.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex2.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex2]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex2 = value.toInt();
                                                _anxietyScore1 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "3. I couldn’t seem to experience any positive feeling at all.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex3.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex3]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex3 = value.toInt();
                                                _depressionScore1 =
                                                    value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "4. I experienced breathing difficulty. (e.g. excessively rapid breathing, breathlessness in the absence of physical exertion)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex4.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex4]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex4 = value.toInt();
                                                _anxietyScore2 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "5. I found it difficult to work up the initiative to do things.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex5.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex5]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex5 = value.toInt();
                                                _depressionScore2 =
                                                    value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "6. I tended to over-react to situations.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex6.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex6]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex6 = value.toInt();
                                                _stressScore2 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "7. I experienced trembling. (eg, in the hands)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex7.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex7]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex7 = value.toInt();
                                                _anxietyScore3 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "8. I felt that I was using a lot of nervous energy.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex8.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex8]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex8 = value.toInt();
                                                _stressScore3 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "9. I was worried about situations in which I might panic and make a fool of myself.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex9.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex9]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex9 = value.toInt();
                                                _anxietyScore4 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "10. I felt that I had nothing to look forward to.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex10.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex10]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex10 = value.toInt();
                                                _depressionScore3 =
                                                    value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "11. I found myself getting agitated. (gets annoyed easily)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex11.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex11]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex11 = value.toInt();
                                                _stressScore4 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "12. I found it difficult to relax.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex12.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex12]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex12 = value.toInt();
                                                _stressScore5 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "13. I felt down-hearted and blue.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex13.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex13]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex13 = value.toInt();
                                                _depressionScore4 =
                                                    value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "14. I was intolerant of anything that kept me from getting on with what I was doing.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex14.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex14]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex14 = value.toInt();
                                                _stressScore6 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "15. I felt I was close to panic.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex15.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex15]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex15 = value.toInt();
                                                _anxietyScore5 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "16. I was unable to become enthusiastic about anything.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex16.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex16]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex16 = value.toInt();
                                                _depressionScore5 =
                                                    value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "17. I felt I wasn’t worth much as a person.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex17.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex17]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex17 = value.toInt();
                                                _depressionScore6 =
                                                    value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "18. I felt that I was rather touchy.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex18.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex18]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex18 = value.toInt();
                                                _stressScore7 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "19. I was aware of the action of my heart in the absence of physical exertion.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex19.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex19]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex19 = value.toInt();
                                                _anxietyScore6 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "20. I felt scared without any good reason.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex20.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex20]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex20 = value.toInt();
                                                _anxietyScore7 = value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
                            const SizedBox(
                              height: 20,
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
                                      const Text(
                                        "21. I felt that life was meaningless.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      SliderTheme(
                                          data: const SliderThemeData(
                                            valueIndicatorColor: Color.fromARGB(
                                                255, 225, 228, 228),
                                            thumbColor: Colors.orange,
                                            inactiveTrackColor: Colors.black26,
                                            inactiveTickMarkColor: Colors.white,
                                          ),
                                          child: Slider(
                                            value: selectedIndex21.toDouble(),
                                            min: 0,
                                            max: values.length - 1,
                                            divisions: values.length - 1,
                                            label: values[selectedIndex21]
                                                .toString(),
                                            onChanged: (double value) {
                                              setState(() {
                                                selectedIndex21 = value.toInt();
                                                _depressionScore7 =
                                                    value.toInt();
                                              });
                                            },
                                          )),
                                    ]))),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      title: const Text(
                                        "Are you confirm with your answers?",
                                        style: TextStyle(),
                                      ),
                                      content: const Text("Are you sure?",
                                          style: TextStyle()),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text(
                                            "Yes",
                                            style: TextStyle(),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            calculateScores(
                                                _stressScore1,
                                                _stressScore2,
                                                _stressScore3,
                                                _stressScore4,
                                                _stressScore5,
                                                _stressScore6,
                                                _stressScore7,
                                                _anxietyScore1,
                                                _anxietyScore2,
                                                _anxietyScore3,
                                                _anxietyScore4,
                                                _anxietyScore5,
                                                _anxietyScore6,
                                                _anxietyScore7,
                                                _depressionScore1,
                                                _depressionScore2,
                                                _depressionScore3,
                                                _depressionScore4,
                                                _depressionScore5,
                                                _depressionScore6,
                                                _depressionScore7);

                                            insertResult();
                                            _resultScreen();
                                            if (anxietyScore <= 5 &&
                                                depressionScore <= 6 &&
                                                stressScore <= 9) {
                                              _congrats();
                                            } else if ((anxietyScore > 7 ||
                                                depressionScore > 10 ||
                                                stressScore > 12)) {
                                              _suggest();
                                            }
                                            setState(() {});
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
                                'Submit',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ))),
              )),
        ]));
  }

  calculateScores(
      int stress1,
      int stress2,
      int stress3,
      int stress4,
      int stress5,
      int stress6,
      int stress7,
      int anxiety1,
      int anxiety2,
      int anxiety3,
      int anxiety4,
      int anxiety5,
      int anxiety6,
      int anxiety7,
      int depression1,
      int depression2,
      int depression3,
      int depression4,
      int depression5,
      int depression6,
      int depression7) {
    depressionScore = depression1 +
        depression2 +
        depression3 +
        depression4 +
        depression5 +
        depression6 +
        depression7;
    anxietyScore = anxiety1 +
        anxiety2 +
        anxiety3 +
        anxiety4 +
        anxiety5 +
        anxiety6 +
        anxiety7;
    stressScore =
        stress1 + stress2 + stress3 + stress4 + stress5 + stress6 + stress7;
    if (depressionScore <= 4) {
      depressionLevel = "Normal";
    } else if (depressionScore > 4 && depressionScore <= 6) {
      depressionLevel = "Mild";
    } else if (depressionScore > 6 && depressionScore <= 10) {
      depressionLevel = "Moderate";
    } else if (depressionScore > 10 && depressionScore <= 13) {
      depressionLevel = "Severe";
    } else {
      depressionLevel = "Extremely Severe";
    }

    if (anxietyScore <= 3) {
      anxietyLevel = "Normal";
    } else if (anxietyScore > 3 && anxietyScore <= 5) {
      anxietyLevel = "Mild";
    } else if (anxietyScore > 5 && anxietyScore <= 7) {
      anxietyLevel = "Moderate";
    } else if (anxietyScore > 7 && anxietyScore <= 9) {
      anxietyLevel = "Severe";
    } else {
      anxietyLevel = "Extremely Severe";
    }

    if (stressScore <= 7) {
      stressLevel = "Normal";
    } else if (stressScore > 7 && stressScore <= 9) {
      stressLevel = "Mild";
    } else if (stressScore > 9 && stressScore <= 12) {
      stressLevel = "Moderate";
    } else if (stressScore > 12 && stressScore <= 16) {
      stressLevel = "Severe";
    } else {
      stressLevel = "Extremely Severe";
    }
  }

  void insertResult() {
    String tempDepressionScore = depressionScore.toString();
    String tempAnxietyScore = anxietyScore.toString();
    String tempStressScore = stressScore.toString();
    http.post(Uri.parse("${ServerConfig.SERVER}/php/insert_result.php"), body: {
      "userid": widget.user.id,
      "depressionScore": tempDepressionScore,
      "depressionLevel": depressionLevel,
      "anxietyScore": tempAnxietyScore,
      "anxietyLevel": anxietyLevel,
      "stressScore": tempStressScore,
      "stressLevel": stressLevel,
    }).then((response) {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['status'] == "success") {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);

        return;
      } else {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);
        return;
      }
    });
  }

  void _resultHistory() {
    User user = widget.user;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (content) => ResultHistoryScreen(user: user)));
  }

  void _resultScreen() {
    User user = widget.user;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (content) => ResultScreen(
                user: user,
                depressionScore: depressionScore,
                anxietyScore: anxietyScore,
                stressScore: stressScore,
                depressionLevel: depressionLevel,
                anxietyLevel: anxietyLevel,
                stressLevel: stressLevel)));
  }

  void _congrats() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          title: const Text(
            "CONGRATULATIONS!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          icon: WidgetAnimator(
            atRestEffect: WidgetRestingEffects.size(),
            child: const Icon(
              Icons.auto_awesome_outlined,
              size: 50,
            ),
          ),
          content: const Text(
              "We know how hard you've been working to improve your mental health, and your wonderful DASS-21 result is a outcome to your hard work.\n\nWe are so proud of you for taking steps to improve your mental health!",
              style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "OK",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();

                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  void _checkCounselor() {
    User user = widget.user;
    Navigator.push(context,
        MaterialPageRoute(builder: (content) => CounselorScreen(user: user)));
  }

  void _suggest() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          title: const Text(
            "We care about your well-being",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          icon: WidgetAnimator(
            atRestEffect: WidgetRestingEffects.pulse(),
            child: const Icon(
              Icons.perm_device_info,
              size: 50,
            ),
          ),
          content: const Text(
              "We have noticed your DASS-21 score was quite high and we are worried about you.\n\nWould you like to talk to our counselors?",
              style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _checkCounselor();
                setState(() {});
              },
            ),
            TextButton(
              child: const Text(
                "I'm fine",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();

                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}
