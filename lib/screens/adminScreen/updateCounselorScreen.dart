import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:reliev_application/models/counselors.dart';

import '../../models/user.dart';
import '../../shared/serverConfig.dart';

class UpdateCounselorScreen extends StatefulWidget {
  final User user;
  final Counselor counselor;

  const UpdateCounselorScreen({
    super.key,
    required this.user,
    required this.counselor,
  });
  @override
  State<UpdateCounselorScreen> createState() => _UpdateCounselorScreenState();
}

class _UpdateCounselorScreenState extends State<UpdateCounselorScreen> {
  final TextEditingController _counselorNameEditingController =
      TextEditingController();
  final TextEditingController _counselorPhoneEditingController =
      TextEditingController();
  final TextEditingController _specializationEditingController =
      TextEditingController();
  final TextEditingController _counselorQuotesEditingController =
      TextEditingController();
  late double screenHeight, screenWidth, resWidth;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _counselorNameEditingController.text =
        widget.counselor.counselorName.toString();
    _counselorPhoneEditingController.text =
        widget.counselor.counselorPhone.toString();
    _specializationEditingController.text =
        widget.counselor.specialization.toString();
    _counselorQuotesEditingController.text =
        widget.counselor.counselorQuotes.toString();
  }

  var pathAsset = "assets/images/add_image.png";

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.75;
    }
    return Scaffold(
        appBar: AppBar(title: const Text("Counselor Detail Edit")),
        body: SingleChildScrollView(
          child: Column(children: [
            Card(
              elevation: 8,
              child: SizedBox(
                  height: screenHeight / 3,
                  width: resWidth,
                  child: CachedNetworkImage(
                    width: resWidth,
                    fit: BoxFit.cover,
                    imageUrl:
                        "${ServerConfig.SERVER}/assets/counselorimages/${widget.counselor.counselorId}.png",
                    placeholder: (context, url) =>
                        const LinearProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Counselor details",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _counselorNameEditingController,
                      validator: (val) => val!.isEmpty || (val.length < 3)
                          ? "Counselor name must be longer than 3"
                          : null,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: 'Counselor Name',
                          labelStyle: TextStyle(),
                          icon: Icon(Icons.person),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ))),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _specializationEditingController,
                      validator: (val) => val!.isEmpty || (val.length < 3)
                          ? "Area of specialization must be longer than 3 words"
                          : null,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          labelText: 'Specialization',
                          labelStyle: TextStyle(),
                          icon: Icon(Icons.home_repair_service),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ))),
                  TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _counselorPhoneEditingController,
                      validator: (val) => val!.isEmpty || (val.length < 10)
                          ? "Phone must longer than 10"
                          : null,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          labelText: 'Counselor phone number',
                          alignLabelWithHint: true,
                          labelStyle: TextStyle(),
                          icon: Icon(
                            Icons.phone_android,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2.0),
                          ))),
                  Row(children: [
                    Flexible(
                      flex: 5,
                      child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: _counselorQuotesEditingController,
                          decoration: const InputDecoration(
                              labelText: 'Quotes',
                              labelStyle: TextStyle(),
                              icon: Icon(Icons.question_answer),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2.0),
                              ))),
                    ),
                  ]),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      child: const Text('Update Counselor'),
                      onPressed: () => {_updateCounselorDialog()},
                    ),
                  ),
                ]),
              ),
            )
          ]),
        ));
  }

  _updateCounselorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text(
            "Update this Counselor?",
            style: TextStyle(),
          ),
          content: const Text("Are you sure?", style: TextStyle()),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _updateCounselor();
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

  void _updateCounselor() {
    String counselor_name = _counselorNameEditingController.text;
    String counselor_phone = _counselorPhoneEditingController.text;
    String specialization = _specializationEditingController.text;
    String counselor_quotes = _counselorQuotesEditingController.text;

    http.post(Uri.parse("${ServerConfig.SERVER}/php/update_counselors.php"),
        body: {
          "counselor_id": widget.counselor.counselorId,
          "counselor_name": counselor_name,
          "counselor_phone": counselor_phone,
          "specialization": specialization,
          "counselor_quotes": counselor_quotes,
        }).then((response) {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['status'] == "success") {
        Fluttertoast.showToast(
            msg: "Success",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);
        Navigator.of(context).pop();
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
}
