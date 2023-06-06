import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ndialog/ndialog.dart';
import '../../models/result.dart';
import '../../models/user.dart';
import 'package:http/http.dart' as http;
import '../../shared/serverConfig.dart';
import 'mainScreen.dart';

class ResultHistoryScreen extends StatefulWidget {
  final User user;
  const ResultHistoryScreen({super.key, required this.user});

  @override
  State<ResultHistoryScreen> createState() => _ResultHistoryScreenState();
}

class _ResultHistoryScreenState extends State<ResultHistoryScreen> {
  List<Result> resultList = <Result>[];
  String titlecenter = "Loading...";
  final df = DateFormat('dd/MM/yyyy hh:mm a');
  late double screenHeight, screenWidth, resWidth;
  int numberofresult = 0;
  int rowcount = 2;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadResults();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
      rowcount = 2;
    } else {
      resWidth = screenWidth * 0.75;
      rowcount = 3;
    }
    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
            appBar: AppBar(title: const Text('Result History'), actions: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  _home();
                },
              ),
            ]),
            body: Stack(children: <Widget>[
              Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Normal Screen.png'),
                          fit: BoxFit.cover))),
              resultList.isEmpty
                  ? Center(
                      child: Text(titlecenter,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)))
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Previous Attempts ($numberofresult found)",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: GridView.count(
                            crossAxisCount: rowcount,
                            children: List.generate(resultList.length, (index) {
                              return Card(
                                elevation: 8,
                                child: InkWell(
                                  child: Column(children: [
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Flexible(
                                        flex: 8,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                df.format(DateTime.parse(
                                                    resultList[index]
                                                        .resultDate
                                                        .toString())),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 6,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("Depression:"),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    truncateString(
                                                        resultList[index]
                                                            .depressionScore
                                                            .toString(),
                                                        20),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                truncateString(
                                                    resultList[index]
                                                        .depressionLevel
                                                        .toString(),
                                                    20),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("Anxiety:"),
                                                  const SizedBox(
                                                    width: 25,
                                                  ),
                                                  Text(
                                                    truncateString(
                                                        resultList[index]
                                                            .anxietyScore
                                                            .toString(),
                                                        20),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                truncateString(
                                                    resultList[index]
                                                        .anxietyLevel
                                                        .toString(),
                                                    20),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Row(
                                                children: [
                                                  const Text("Stress:"),
                                                  const SizedBox(
                                                    width: 30,
                                                  ),
                                                  Text(
                                                    truncateString(
                                                        resultList[index]
                                                            .stressScore
                                                            .toString(),
                                                        20),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                truncateString(
                                                    resultList[index]
                                                        .stressLevel
                                                        .toString(),
                                                    20),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ))
                                  ]),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
            ])));
  }

  String truncateString(String str, int size) {
    if (str.length > size) {
      str = str.substring(0, size);
      return "$str...";
    } else {
      return str;
    }
  }

  void _loadResults() {
    http
        .get(
      Uri.parse(
          "${ServerConfig.SERVER}/php/load_studentResult.php?userid=${widget.user.id}"),
    )
        .then((response) {
      ProgressDialog progressDialog = ProgressDialog(
        context,
        blur: 5,
        message: const Text("Loading..."),
        title: null,
      );
      progressDialog.show();
      // wait for response from the request
      if (response.statusCode == 200) {
        //if statuscode OK
        if (response.statusCode == 200) {
          //if statuscode OK
          var jsondata = jsonDecode(
              response.body); //decode response body to jsondata array
          if (jsondata['status'] == 'success') {
            //check if status data array is success
            var extractdata =
                jsondata['data']; //extract data from jsondata array
            if (extractdata['results'] != null) {
              //check if  array object is not null
              numberofresult = int.parse(jsondata['numberofresult']);
              resultList = <Result>[]; //complete the array object definition
              extractdata['results'].forEach((v) {
                //traverse homestays array list and add to the list object array homestayList
                resultList.add(Result.fromJson(
                    v)); //add each product array to the list object array homestayList
              });
              titlecenter = "Found";
            } else {
              titlecenter =
                  "No result Available"; //if no data returned show title center
              resultList.clear();
            }
          }
        } else {
          titlecenter = "No Resultsss Available"; //status code other than 200
          resultList.clear(); //clear ResultList array
        }

        setState(() {}); //refresh UI
        progressDialog.dismiss();
      }
    });
  }

  void _home() {
    User user = widget.user;
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (content) => MainScreen(user: user)));
  }
}
