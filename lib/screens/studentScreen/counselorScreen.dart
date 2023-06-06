import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:ndialog/ndialog.dart';
import 'package:reliev_application/models/user.dart';
import 'package:http/http.dart' as http;
import '../../models/counselors.dart';
import '../../shared/serverConfig.dart';
import 'studCounselorDetail.dart';

class CounselorScreen extends StatefulWidget {
  final User user;
  const CounselorScreen({super.key, required this.user});

  @override
  State<CounselorScreen> createState() => _CounselorScreenState();
}

class _CounselorScreenState extends State<CounselorScreen> {
  String titlecenter = "Loading...";
  List<Counselor> counselorList = <Counselor>[];
  late double screenHeight, screenWidth, resWidth;
  int rowcount = 2;

  @override
  void initState() {
    super.initState();
    _loadCounselors();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    resWidth = screenWidth;
    rowcount = 1;

    return WillPopScope(
        onWillPop: () async => true,
        child: Scaffold(
          appBar: AppBar(title: const Text('FREE COUNSELLING SERVICES')),
          body: Stack(children: <Widget>[
            Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Normal Screen.png'),
                        fit: BoxFit.cover))),
            counselorList.isEmpty
                ? Center(
                    child: Text(titlecenter,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)))
                : Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Counselor List",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: counselorList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              elevation: 8,
                              child: InkWell(
                                onTap: () {
                                  _showDetails(index);
                                },
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 15,
                                      child: CachedNetworkImage(
                                        width: resWidth / 2.5,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            "${ServerConfig.SERVER}/assets/counselorimages/${counselorList[index].counselorId}.png",
                                        placeholder: (context, url) =>
                                            const LinearProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          truncateString(
                                              counselorList[index]
                                                  .counselorName
                                                  .toString(),
                                              20),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          truncateString(
                                              counselorList[index]
                                                  .counselorPhone
                                                  .toString(),
                                              12),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
          ]),
        ));
  }

  String truncateString(String str, int size) {
    if (str.length > size) {
      str = str.substring(0, size);
      return "$str...";
    } else {
      return str;
    }
  }

  void _loadCounselors() {
    http
        .get(
      Uri.parse(
          "${ServerConfig.SERVER}/php/load_counselors.php?userid=${widget.user.id}"),
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
        var jsondata =
            jsonDecode(response.body); //decode response body to jsondata array
        if (jsondata['status'] == 'success') {
          //check if status data array is success
          var extractdata = jsondata['data'];
          if (extractdata['counselors'] != null) {
            //check if  array object is not null
            counselorList = <Counselor>[];
            extractdata['counselors'].forEach((v) {
              counselorList.add(Counselor.fromJson(v));
            });
            titlecenter = "Found";
          } else {
            titlecenter =
                "No counselors Available"; //if no data returned show title center
            counselorList.clear();
          }
        }
      } else {
        titlecenter = "No Counselors Available"; //status code other than 200
        counselorList.clear(); //clear counselorList array
      }
      progressDialog.dismiss();
      setState(() {}); //refresh UI
    });
  }

  _showDetails(int index) async {
    Counselor counselor = Counselor.fromJson(counselorList[index].toJson());

    ProgressDialog progressDialog = ProgressDialog(
      context,
      blur: 5,
      message: const Text("Loading..."),
      title: null,
    );
    progressDialog.show();
    Timer(const Duration(seconds: 1), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (content) => StudCounselorDetails(
                    user: widget.user,
                    counselor: counselor,
                  )));
    });
    progressDialog.dismiss();
  }
}
