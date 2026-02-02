import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Replace AnimatedSplashScreen with your own splash widget
      home: VideoSplashScreen(),
    );
  }
}

// Custom splash screen with video
class VideoSplashScreen extends StatefulWidget {
  @override
  State<VideoSplashScreen> createState() => _VideoSplashScreenState();
}

class _VideoSplashScreenState extends State<VideoSplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('lib/use.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const StartPage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller.value.isInitialized
          ? SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            )
          : Container(color: Colors.black),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List<String> imgPaths = [
    'lib/w.png',
    'lib/p.png',
    'lib/u.png', // New image for center
  ];

  final List<Alignment> imgAlignments = [
    Alignment.topLeft, // First image: top left
    Alignment.bottomRight, // Second image: bottom right
    Alignment.centerRight, // Third image: center
  ];

  late List<bool> _showGoList;

  @override
  void initState() {
    super.initState();
    _showGoList = List.filled(imgPaths.length, false);
    // Staggered animation for each image
    for (int i = 0; i < imgPaths.length; i++) {
      Future.delayed(Duration(milliseconds: 400 * i), () {
        if (mounted) {
          setState(() {
            _showGoList[i] = true;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/yu.jpeg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // Add vertical spacing between images using Positioned or Padding
          ...List.generate(imgPaths.length, (i) {
            return AnimatedSlide(
              offset: _showGoList[i] ? Offset(0, 0) : Offset(-2, 0),
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeOut,
              child: Align(
                alignment: imgAlignments[i % imgAlignments.length],
                child: Padding(
                  // Adjust vertical: e.g., 0 for first, 80 for second, etc.
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Image.asset(
                    imgPaths[i],
                    width: 260,
                    height: 260,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePg(thng: inp)),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
    );
  }
}

class din {
  final String name;
  final String img;
  final String des;
  int quantity;
  din(this.name, this.img, this.des, {this.quantity = 1});
}

final List<din> inp = [
  din("Pizza", "lib/asset/aa.jpeg", "Delicious cheese pizza"),
  din("Burger", "lib/asset/bb.jpeg", "Juicy  burger"),
  din("Pasta", "lib/asset/cc.jpeg", "Italian pasta with sauce"),
   din("Nashta", "lib/asset/dd.jpeg", "Italian pasta with sauce"),
  din("Dhokla", "lib/asset/ee.jpeg", "Italian pasta with sauce"),
  din("Kadhi", "lib/asset/ff.jpeg", "Italian pasta with sauce"),
  din("Mango", "lib/asset/ii.jpeg", "Italian pasta with sauce"),
  din("Strawberry", "lib/asset/jj.jpeg", "Italian pasta with sauce"),
];

List<din> cartItm = [];
