import 'dart:async';
import 'dart:io';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../models/counselors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../models/user.dart';
import '../../shared/serverConfig.dart';

class StudCounselorDetails extends StatefulWidget {
  final User user;
  final Counselor counselor;

  const StudCounselorDetails(
      {super.key, required this.user, required this.counselor});

  @override
  State<StudCounselorDetails> createState() => _StudCounselorDetailsState();
}

class _StudCounselorDetailsState extends State<StudCounselorDetails> {
  late double screenHeight, screenWidth, resWidth;
  bool isDisable = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth;
    } else {
      resWidth = screenWidth * 0.90;
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Counselor Details")),
      body: Column(children: [
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
                placeholder: (context, url) => const LinearProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.counselor.counselorName.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: screenWidth - 16,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.none, width: 1),
                columnWidths: const {
                  0: FixedColumnWidth(150),
                  1: FixedColumnWidth(200),
                },
                children: [
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [Text('')]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [Text('')]),
                  ]),
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Phone:',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold))
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.counselor.counselorPhone.toString(),
                              style: const TextStyle(fontSize: 18.0))
                        ]),
                  ]),
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [Text('')]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [Text('')]),
                  ]),
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Specialization:',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold))
                        ]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.counselor.specialization.toString(),
                              style: const TextStyle(fontSize: 18.0))
                        ]),
                  ]),
                  TableRow(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [Text('')]),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [Text('')]),
                  ]),
                  TableRow(children: [
                    SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Quotes:',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.counselor.counselorQuotes.toString(),
                              style: const TextStyle(fontSize: 18.0))
                        ]),
                  ]),
                ]),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Card(
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WidgetAnimator(
                      atRestEffect: WidgetRestingEffects.bounce(),
                      child: IconButton(
                          iconSize: 32,
                          onPressed: isDisable ? null : _makePhoneCall,
                          icon: const Icon(Icons.call)),
                    ),
                    WidgetAnimator(
                      atRestEffect: WidgetRestingEffects.bounce(),
                      child: IconButton(
                          iconSize: 32,
                          onPressed: isDisable ? null : _makeSmS,
                          icon: const Icon(Icons.message)),
                    ),
                    WidgetAnimator(
                      atRestEffect: WidgetRestingEffects.bounce(),
                      child: IconButton(
                          iconSize: 32,
                          onPressed: isDisable ? null : openwhatsapp,
                          icon: const Icon(Icons.whatsapp)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Future<void> _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: widget.counselor.counselorPhone,
    );
    await launchUrl(launchUri);
  }

  Future<void> _makeSmS() async {
    final Uri launchUri = Uri(
      scheme: 'sms',
      path: widget.counselor.counselorPhone,
    );
    await launchUrl(launchUri);
  }

  openwhatsapp() async {
    var whatsapp = widget.counselor.counselorPhone;
    var whatsappURlAndroid = "whatsapp://send?phone=+6$whatsapp&text=hello";
    var whatappURLIos = "https://wa.me/+6$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("whatsapp not installed")));
      }
    }
  }
}
