import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storieland/constants.dart';
import 'dart:developer' as developer;
import 'local_bottom_navigation_bar.dart';

class VideoPlayrePage extends StatefulWidget {
  const VideoPlayrePage({Key? key}) : super(key: key);

  @override
  State<VideoPlayrePage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayrePage> {
  int _currentIndex = 0;
  late List<CustomVideoPlayerController> _customVideoPlayerControllers;
  late List<String> assetVideoPaths;
  late List<String> videoTitles;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayers();
  }

  @override
  void dispose() {
    for (var controller in _customVideoPlayerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    developer.log('Debug message', name: 'my.app.category');
    return DefaultTextStyle(
        style: TextStyle(
          fontSize: 16.0,
        ),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.2),
          child: Scaffold(
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
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "StorieLand",
                            style: GoogleFonts.chicle(
                              color: Color.fromARGB(255, 26, 56, 112),
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 60),
                    ],
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
            bottomNavigationBar: LocalBottomNavigationBar(
              currentIndex: _currentIndex,
              onItemSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ));
  }

  Widget buildVideoCard(int index) {
    developer.log('Debug message', name: 'my.app.category');
    return Container(
      width: 150,
      margin: EdgeInsets.all(8),
      child: Card(
        color: Color.fromARGB(200, 248, 223, 223).withOpacity(0.5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: Color.fromARGB(200, 248, 223, 223).withOpacity(0.5),
            width: 1.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(122, 192, 192, 192).withOpacity(0.8),
                  const Color.fromARGB(0, 255, 255, 255),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomVideoPlayer(
                  key: UniqueKey(),
                  customVideoPlayerController:
                      _customVideoPlayerControllers[index],
                ),
                SizedBox(height: 2),
                Text(
                  videoTitles[index],
                  style: GoogleFonts.chewy(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(227, 30, 61, 66),
                    shadows: [
                      Shadow(
                        color: const Color.fromARGB(255, 110, 110, 110)
                            .withOpacity(0.5),
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
      ),
    );
  }

  void initializeVideoPlayers() {
    assetVideoPaths = [
      "assets/video/themonkeyparty.mp4",
      "assets/video/The_Farmyard_Adventure.mp4",
      "assets/video/ocean.mp4",
      "assets/video/test1.mp4",
      "assets/video/test2.mp4",
      "assets/video/test3.mp4",
    ];
    videoTitles = [
      "The Forest Clearing",
      "The Farmyard Adventure",
      "The Ocean's Classroom",
      "child and children",
      "panda hungry",
      "lulu and lylyl",
    ];

    _customVideoPlayerControllers = List.generate(
      assetVideoPaths.length,
      (index) {
        VideoPlayerController videoPlayerController =
            VideoPlayerController.asset(assetVideoPaths[index]);
        videoPlayerController.initialize().then((_) {
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
