import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPlayrePage extends StatefulWidget {
  const VideoPlayrePage({Key? key}) : super(key: key);

  @override
  State<VideoPlayrePage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayrePage> {
  late List<CustomVideoPlayerController> _customVideoPlayerControllers;
  late List<String> assetVideoPaths;
  late List<String> videoTitles;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/SL_123020_39360_14.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "StorieLand",
              style: GoogleFonts.chicle(
                color: Color.fromARGB(255, 26, 56, 112),
                fontWeight: FontWeight.w900,
                fontSize: 40,
                height: 1,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                height: 500,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: _customVideoPlayerControllers.length,
                  itemBuilder: (context, index) {
                    return buildVideoCard(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVideoCard(int index) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomVideoPlayer(
                customVideoPlayerController:
                    _customVideoPlayerControllers[index],
              ),
              SizedBox(height: 2),
              Text(
                videoTitles[index],
                style: GoogleFonts.chewy(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 55, 151, 151),
                  shadows: [
                    Shadow(
                      color:
                          Color.fromARGB(255, 155, 133, 133).withOpacity(0.5),
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  void initializeVideoPlayers() {
    assetVideoPaths = [
      "assets/video/1212.mp4",
      "assets/video/123123.mp4",
      "assets/video/test1.mp4",
      "assets/video/test2.mp4",
      "assets/video/test3.mp4",
    ];

    videoTitles = [
      "storie time away",
      "in the end now",
      "child and children",
      "panda hungry",
      "lulu and lylyl",
    ];

    _customVideoPlayerControllers = List.generate(
      assetVideoPaths.length,
      (index) {
        VideoPlayerController videoPlayerController =
            VideoPlayerController.asset(assetVideoPaths[index])
              ..initialize().then((value) {
                setState(() {});
              });

        return CustomVideoPlayerController(
          context: context,
          videoPlayerController: videoPlayerController,
        );
      },
    );
  }
}
