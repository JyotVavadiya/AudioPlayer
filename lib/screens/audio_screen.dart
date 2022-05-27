import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'model_class.dart';

class audio_page extends StatefulWidget {
  int songdata;

  audio_page(this.songdata);

  @override
  State<audio_page> createState() => _audio_pageState();
}

class _audio_pageState extends State<audio_page> {
  String? totalDuration;
  String? currentPosition;

  double totalDurationInSecond = 0;
  double currentPositionInSecond = 0; // slider mate

  final AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetsAudioPlayer.open(
      Audio("${song[widget.songdata].song}"),
      autoStart: false,
    );
    // song ketla time nu 6?
    assetsAudioPlayer.current.listen((Playing? playing) {
      setState(() {
        totalDuration = playing!.audio.duration.toString().split(".")[0];
        totalDurationInSecond = playing.audio.duration.inSeconds.toDouble();
      });
    });
    // song je aagal vadhe tem duration btlati jay tena mate
    assetsAudioPlayer.currentPosition.listen((Duration duration) {
      setState(() {
        currentPosition = duration.toString().split(".")[0];
        currentPositionInSecond = duration.inSeconds.toDouble();
      });
    });
  }

  var isPlaying = false;

  bool volum = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("${song[widget.songdata].image}"),
                )),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 100),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("${song[widget.songdata].image}"),
                      )),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${song[widget.songdata].title}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${song[widget.songdata].subtitle}",
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, letterSpacing: 3),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () async {
                      await assetsAudioPlayer.stop();
                    },
                    icon: Icon(
                      Icons.stop,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  (isPlaying)
                      ? IconButton(
                    onPressed: () async {
                      await assetsAudioPlayer.pause();
                      setState(() {
                        isPlaying = false;
                      });
                    },
                    icon: Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                      : IconButton(
                    onPressed: () async {
                      await assetsAudioPlayer.play();
                      setState(() {
                        isPlaying = true;
                      });
                    },
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  (volum)
                      ? IconButton(
                      onPressed: () async {
                        setState(() {
                          volum = false;
                        });
                        await assetsAudioPlayer.setVolume(0);
                      },
                      icon: Icon(
                        Icons.headset,
                        color: Colors.white,
                        size: 40,
                      ))
                      : IconButton(
                      onPressed: () async {
                        setState(() {
                          volum = true;
                        });
                        await assetsAudioPlayer.setVolume(1);
                      },
                      icon: Icon(
                        Icons.headset_off,
                        color: Colors.white,
                        size: 40,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Slider(
                  value: currentPositionInSecond,
                  min: 0,
                  max: totalDurationInSecond,
                  activeColor: song[widget.songdata].mycolor,
                  thumbColor: song[widget.songdata].mycolor,
                  inactiveColor: Colors.grey,
                  onChanged: (val) {
                    setState(() {
                      currentPositionInSecond = val;
                      assetsAudioPlayer.seek(Duration(
                        seconds: val.toInt(),
                      ));
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Text("${currentPosition} / ${totalDuration}", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
            ],
          ),
        ],
      ),

    );
  }
}