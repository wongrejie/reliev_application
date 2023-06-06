import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../../models/muzics.dart';

class AudioDetailScreen extends StatefulWidget {
  const AudioDetailScreen({super.key, required this.mMusic});
  final Musics mMusic;

  @override
  AudioDetailScreenState createState() => AudioDetailScreenState();
}

class AudioDetailScreenState extends State<AudioDetailScreen> {
  //8.Setting the player UI Data
  IconData btnIcon = Icons.play_arrow;
  var bgColor = const Color.fromARGB(255, 27, 46, 100);
  var iconHoverColor = const Color(0xFF065BC3);

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  //9.Now add music player
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      duration = newDuration;
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          audioPlayer.pause();
          return true;
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 27, 46, 100),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 250.0,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.mMusic.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [bgColor.withOpacity(0.1), bgColor],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(),
                              ],
                            ),
                            const Spacer(),
                            Text(widget.mMusic.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0)),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              widget.mMusic.singer,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 18.0),
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SliderTheme(
                    data: const SliderThemeData(
                      valueIndicatorColor: Colors.white,
                      thumbColor: Colors.cyan,
                      activeTrackColor: Color.fromARGB(255, 0, 140, 255),
                      inactiveTrackColor: Colors.grey,
                      inactiveTickMarkColor: Colors.white,
                    ),
                    child: Slider(
                      min: 0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) async {
                        final position = Duration(seconds: value.toInt());
                        await audioPlayer.seek(position);

                        await audioPlayer.resume();
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatTime(position),
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        formatTime(duration - position),
                        style: const TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    iconSize: 50,
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        String url = widget.mMusic.url;
                        await audioPlayer.play(UrlSource(url));
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                MaterialButton(
                  onPressed: () {
                    audioPlayer.pause();

                    Navigator.of(context).pop();
                  },
                  child: const Text('Back',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ));
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
