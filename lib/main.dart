//This is an Audio and Video App where both audio and video is played.

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //for the video.....
    var controller;
    controller = VideoPlayerController.asset("assets/video.mp4");

    controller.initialize();
    controller.setLooping(true);
    controller.setVolume(1.0);

    //for the audio.....
    var cache = AudioCache();
    var player = AudioPlayer();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text('Video and Audio Player')),
        ),
        body: Column(
          children: <Widget>[
            // Video Configurations...
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'VIDEO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                'Song : Believer.mp4',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
            ),
            Container(
              height: 200,
              width: 300,
              child: VideoPlayer(controller),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    onPressed: () {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                    },
                    child: Icon(Icons.play_arrow),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(Icons.stop),
                    onPressed: () {
                      controller.pause();
                    },
                  ),
                ),
              ],
            ),

            //Audio Configurations
            Container(
              margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Text(
                'AUDIO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: Text(
                'Song : Thunder.mp3',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(Icons.play_arrow),
                    onPressed: () async {
                      {
                        player =
                            await cache.play('song.mp3'); // assign player here
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(Icons.stop),
                    onPressed: () async {
                      await player.pause();
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(Icons.pause),
                    onPressed: () async {
                      await player?.resume();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
