import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'audio_state.dart'; // Import PlayerState

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio App'),
      ),
      body: Center(
        child: Consumer<PlayerState>(
          builder: (context, playerState, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display playback status
                Text(
                  playerState.isPlaying ? 'Playing' : 'Paused',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                // Display metadata
                Text(
                  'Title: ${playerState.title}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Artist: ${playerState.artist}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Album: ${playerState.album}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    playerState.play(); // Play the audio
                  },
                  child: Text('Play'),
                ),
                ElevatedButton(
                  onPressed: () {
                    playerState.pause(); // Pause the audio
                  },
                  child: Text('Pause'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
