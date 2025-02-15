import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'audio_state.dart'; // Import PlayerState
import 'drawer_menu.dart'; // Import the separate drawer class

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, size: 30, color: Colors.black),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/ecoute.jpeg',
              width: 40,
              height: 40,
            ),
            
          ],
        ),
      ),
      drawer: DrawerMenu(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/ecoute.jpeg',
                        width: 220,
                        height: 220,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'RADIO ECOUTE FM',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: IconButton(
                            icon: Icon(Icons.share, size: 30, color: Colors.black),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 40,
                          child: Consumer<PlayerState>(
                            builder: (context, playerState, child) {
                              return IconButton(
                                icon: Icon(
                                  playerState.isPlaying ? Icons.pause : Icons.play_arrow,
                                  size: 40,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  playerState.isPlaying ? playerState.pause() : playerState.play();
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: IconButton(
                            icon: Icon(Icons.cast, size: 30, color: Colors.black),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Slider(
                        value: 0.5,
                        onChanged: (value) {},
                        min: 0.0,
                        max: 1.0,
                        activeColor: Colors.amber,
                        inactiveColor: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '+1 514-217-3553',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
