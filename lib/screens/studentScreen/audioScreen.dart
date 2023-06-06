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
              "https://drive.google.com/uc?id=1FAWQUNRdyg7XpUMAimlfnqezdWqwpgMy"),
      Musics(
        title: "Five minutes Breathing",
        singer: "Dr Cheryl Rezek",
        url: "https://drive.google.com/uc?id=1EwJk4AIeiG0rGahi72Xq_oL6rhbfdpYS",
        image:
            "https://drive.google.com/uc?id=1S2ywmdn_2dZUn2ioT9S_qSRk4OmjhNwN",
      ),
      Musics(
        title: "Sitting meditation",
        singer: "Kieran Fleck",
        url: "https://drive.google.com/uc?id=1xUdzMOWfUPxvCmHpVXF2yAaYa0A8WlKw",
        image:
            "https://drive.google.com/uc?id=1u9ec81lw4kjEb-PG8EQIkq7fTAfyAj6O",
      ),
      Musics(
          title: "Mountain meditation",
          singer: "Peter Morgan",
          url:
              "https://drive.google.com/uc?id=1wAIv7C9qdfvQrHlybtV9bbqkdIZTQXI1",
          image:
              "https://drive.google.com/uc?id=1FAWQUNRdyg7XpUMAimlfnqezdWqwpgMy"),
      Musics(
          title: "Sugar",
          singer: "Adele",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows7_5ea7d4db364a2.jpeg"),
      Musics(
          title: "Believer",
          singer: "Ed Sheeran",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3",
          image:
              "https://img.mensxp.com/media/content/2020/Apr/Leading-B-Wood-Singers-Who-Lost-On-Reality-Shows6_5ea7d4c7225c1.jpeg"),
      Musics(
          title: "Stressed out",
          singer: "Mark Ronson",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3",
          image:
              "https://i.pinimg.com/originals/7c/a1/08/7ca1080bde6228e9fb8460915d36efdd.jpg"),
      Musics(
          title: "Girls Like You",
          singer: "Maroon 5",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3",
          image:
              "https://i.pinimg.com/originals/1b/b8/55/1bb8552249faa2f89ffa0d762d87088d.jpg"),
      Musics(
          title: "Let her go",
          singer: "Passenger",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3",
          image:
              "https://64.media.tumblr.com/5b7c0f14e4e50922ccc024573078db42/15bda826b481de6f-5a/s1280x1920/b26b182f789ef7bb7be15b037e2e687b0fbc437d.jpg"),
      Musics(
          title: "Roar",
          singer: "Katy Perry",
          url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3",
          image:
              "https://cdn2.stylecraze.com/wp-content/uploads/2013/11/Jesus-On-Her-Wrist.jpg.webp"),
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
