import 'package:flutter/material.dart';
import '../../components/muzicListView.dart';
import '../../models/muzics.dart';

import 'audioDetailScreen.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  //3.Add list of songs

  late List musics;

  @override
  void initState() {
    musics = getList();
    super.initState();
  }

  List getList() {
    return [
      Musics(
          title: "Three minutes Breathing",
          singer: "Peter Morgan",
          url:
              "https://drive.google.com/uc?id=1nzkNZ9r2SWWn86NTDykEkCj4HosAgfGb",
          image:
              "https://drive.google.com/uc?id=1wUGFIsVxz3XV_kyg-5JO-TWhjzzNy8Jt"),
      Musics(
        title: "Five minutes Breathing",
        singer: "Dr Cheryl Rezek",
        url: "https://drive.google.com/uc?id=1EwJk4AIeiG0rGahi72Xq_oL6rhbfdpYS",
        image:
            "https://drive.google.com/uc?id=1JUGIxNfQuO0Ay6xvV6DtcGWnqkVZ2FdB",
      ),
      Musics(
        title: "Sitting meditation",
        singer: "Kieran Fleck",
        url: "https://drive.google.com/uc?id=1xUdzMOWfUPxvCmHpVXF2yAaYa0A8WlKw",
        image:
            "https://drive.google.com/uc?id=1HI5IN8QxSXeKcIDLIDsYNCiL3-zNIQ9-",
      ),
      Musics(
          title: "Mountain meditation",
          singer: "Peter Morgan",
          url:
              "https://drive.google.com/uc?id=1wAIv7C9qdfvQrHlybtV9bbqkdIZTQXI1",
          image:
              "https://drive.google.com/uc?id=1rEfHZcrmlVcZQXITCf2zKxorOuRY-N4-"),
      Musics(
          title: "The Breathing Space",
          singer: "Vidyamala Burch",
          url:
              "https://drive.google.com/uc?id=19cCxG03o26RJB57g4xMUdyoDQlvaK8vS",
          image:
              "https://drive.google.com/uc?id=1NUqqvvNNuZylRoWBx0wYDmKDlAXV09Rg"),
      Musics(
          title: "Tension Release Meditation",
          singer: "Vidyamala Burch",
          url:
              "https://drive.google.com/uc?id=1dcsW9byG8G4Gyb1hFvtFS27LnrBdfvDA",
          image:
              "https://drive.google.com/uc?id=1CycbHN9-m1CgF-Kid-g-ELoKJ3Z-mkSU"),
      Musics(
        title: "Body scan",
        singer: "Kieran Fleck",
        url: "https://drive.google.com/uc?id=1MJg3N9e-EjHKrjHAbxHWgsBJJPR0Am4-",
        image:
            "https://drive.google.com/uc?id=1wJOr4o2EdB4lc77sWOgry_cEs2sZGFMT",
      ),
      Musics(
          title: "Compassionate Breath",
          singer: "Vidyamala Burch",
          url:
              "https://drive.google.com/uc?id=1toFaicXEpAKaUoDxqWnpg1l3FT137ifw",
          image:
              "https://drive.google.com/uc?id=1YktMeYZAgziTJDSXEe5FVcX11nTpMdw6"),
      Musics(
          title: "Ten minute breathing",
          singer: "Peter Morgan",
          url:
              "https://drive.google.com/uc?id=1nzkNZ9r2SWWn86NTDykEkCj4HosAgfGb",
          image:
              "https://drive.google.com/uc?id=13fAhTQ4NvfKgmTNsw8vOIZ-jpQyZsZzX"),
      Musics(
          title: "Three minute mindfulness of sounds",
          singer: "Peter Morgan",
          url:
              "https://drive.google.com/uc?id=1gYU6ayzOSzZZtEAlfGJ3BlFmFt73zb9m",
          image:
              "https://drive.google.com/uc?id=18NpX95vbh2v2FcQ3quA27w0zfMF99a5I"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 46, 100),
          title: const Text(
            "Breathing Exercises",
            style: TextStyle(fontSize: 18.0, color: Colors.white70),
          ),
        ),
        body: Stack(children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Mountains-At-Night-Fog-Snow.jpg'),
                      fit: BoxFit.cover))),
          Column(children: [
            //divided into two parts
            //one which consists of list of songs
            Expanded(
              child: ListView.builder(
                  itemCount: getList().length,
                  itemBuilder: (context, index) => muzicListView(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AudioDetailScreen(mMusic: musics[index])),
                          );
                        },
                        title: musics[index].title,
                        singer: musics[index].singer,
                        url: musics[index].singer,
                        image: musics[index].image,
                      )),
            ),
          ]),
        ]));
  }
}
