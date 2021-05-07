import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
//responsible for a single animation within a class
    with
        SingleTickerProviderStateMixin {
  //thi is used to control the animation of my play_pause icon
  AnimationController controller;

  AudioPlayer audioPlayer = AudioPlayer();

  int playStatus = 0;

  //init state : it is called first and called on on the build of this object
  @override
  initState() {
    //because i want my variable to be instantiated  once
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  _playMusic() async {
    //Future // async // await
    int audioRes = await audioPlayer.play(
        "https://naijaloaded.store/wp-content/uploads/2021/04/Burna-Boy-Kilometre.mp3");
    //Assigning the response from our music to this variable to change the method on either play or pause
    setState(() {
      playStatus = audioRes;
      //changing the icon on the animation icon widget
      controller.forward();
    });
  }

  _pauseMusic() async {
    var pauseRes = await audioPlayer.pause();
    if (pauseRes == 1) {
      setState(() {
        playStatus = 0;
        controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Top for the MuSIC
          //Aspect Ration is a way of easily calculating the dimension of the device your app is running.
          AspectRatio(
            aspectRatio: 0.75,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.grey,
                  ],
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://promo.com/tools/image-resizer/static/Pattern_image-8c050053eab884e51b8599607865d112.jpg"),
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepOrange.withOpacity(0.2),
                        blurRadius: 16,
                        spreadRadius: 1,
                        offset: Offset(0, 4),
                      )
                    ]),
              ),
            ),
          ),

          //Bottom for the music control options
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  LinearProgressIndicator(
                    value: 0.4,
                    backgroundColor: Colors.grey.shade400,
                    minHeight: 4,
                    valueColor: AlwaysStoppedAnimation(Colors.grey[700]),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 50,
                        icon: Icon(Icons.fast_rewind_rounded),
                        onPressed: () {},
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: InkWell(
                          onTap: playStatus == 0
                              ? () {
                                  _playMusic();
                                }
                              : () {
                                  _pauseMusic();
                                },
                          child: AnimatedIcon(
                            size: 100,
                            icon: AnimatedIcons.play_pause,
                            progress: controller,
                          ),
                        ),
                      ),
                      IconButton(
                        iconSize: 50,
                        icon: Icon(Icons.fast_forward_rounded),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
