import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:reliev_application/models/counselors.dart';
import 'package:reliev_application/screens/adminScreen/updateCounselorScreen.dart';
import '../../models/user.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../shared/loginScreen.dart';
import '../../shared/serverConfig.dart';
import 'newCounselorScreen.dart';

class AdminScreen extends StatefulWidget {
  final User user;
  const AdminScreen({super.key, required this.user});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
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
    counselorList = [];
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
        onWillPop: () async => false,
        child: Scaffold(
          appBar:
              AppBar(title: const Text('Counselor List'), actions: const []),
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
                      Expanded(
                          child: GridView.count(
                              crossAxisCount: rowcount,
                              children:
                                  List.generate(counselorList.length, (index) {
                                return Card(
                                    elevation: 8,
                                    child: InkWell(
                                      onTap: () {
                                        _showDetails(index);
                                      },
                                      onLongPress: () {
                                        _deleteDialog(index);
                                      },
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Flexible(
                                            flex: 15,
                                            child: CachedNetworkImage(
                                              width: resWidth / 1.5,
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  "${ServerConfig.SERVER}/assets/counselorimages/${counselorList[index].counselorId}.png",
                                              placeholder: (context, url) =>
                                                  const LinearProgressIndicator(),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      const Icon(Icons.error),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
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
                                    ));
                              })))
                    ],
                  ),
          ]),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            children: [
              SpeedDialChild(
                  child: const Icon(Icons.add),
                  label: "Add new counselor",
                  labelStyle: const TextStyle(),
                  onTap: _gotoNewCounselor),
            ],
          ),
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

      setState(() {}); //refresh UI
    });
  }

  _deleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Text(
            "Delete counselor ${truncateString(counselorList[index].counselorName.toString(), 15)}",
            style: const TextStyle(),
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                _deleteCounselor(index);
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
  }

  Future<void> _gotoNewCounselor() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (content) => NewCounselorScreen(
                  user: widget.user,
                )));
  }

  Future<void> _showDetails(int index) async {
    Counselor counselor = Counselor.fromJson(counselorList[index].toJson());

    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (content) => UpdateCounselorScreen(
                  counselor: counselor,
                  user: widget.user,
                )));
    _loadCounselors();
  }

  void _deleteCounselor(index) {
    try {
      http.post(Uri.parse("${ServerConfig.SERVER}/php/delete_counselors.php"),
          body: {
            "counselor_id": counselorList[index].counselorId,
          }).then((response) {
        var data = jsonDecode(response.body);
        if (response.statusCode == 200 && data['status'] == "success") {
          Fluttertoast.showToast(
              msg: "Success",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              fontSize: 14.0);
          _loadCounselors();
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
    } catch (e) {
      print(e.toString());
    }
  }

  void _logoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Logout",
            style: TextStyle(),
          ),
          content: const Text("Are your sure?"),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (content) => LoginScreen(user: widget.user)));
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
  }
}
