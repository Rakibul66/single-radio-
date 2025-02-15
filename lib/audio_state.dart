import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart'; // Import just_audio
import 'package:metadata_fetch/metadata_fetch.dart'; // Import metadata_fetch

class PlayerState extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer(); // Create an AudioPlayer instance
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  String _title = '';
  String _artist = '';
  String _album = '';

  String get title => _title;
  String get artist => _artist;
  String get album => _album;

  // URL of the audio stream
  final String audioUrl = 'http://stream-uk1.radioparadise.com/aac-320';

  // Play the audio
  Future<void> play() async {
    try {
      await _player.setUrl(audioUrl);  // Set the audio URL
      await _player.play();  // Start playing

      _isPlaying = true;
      notifyListeners();

      // Fetch metadata after the audio starts playing
      await _fetchMetadata();
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  // Pause the audio
  Future<void> pause() async {
    await _player.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Stop the audio
  Future<void> stop() async {
    await _player.stop();
    _isPlaying = false;
    notifyListeners();
  }

// Fetch metadata from the audio URL
Future<void> _fetchMetadata() async {
  try {
    // Use extract() instead of fetch() to retrieve metadata
    final metadata = await MetadataFetch.extract(audioUrl);

    if (metadata != null) {
      // Set the metadata values or use 'Unknown' as fallback if not available
      _title = metadata.title ?? 'Unknown Title';
      _artist = metadata.image ?? 'Unknown Artist'; // You can remove this if 'artist' doesn't exist
     print(artist);;

      // If metadata does not have 'artist', you can fallback to description or other fields
      if (_artist == 'Unknown Artist') {
        _artist = metadata.description ?? 'Unknown Artist';
      }
    } else {
      // If no metadata is found, provide default values
      _title = 'No Metadata Available';
      _artist = 'No Metadata Available';
      _album = 'No Metadata Available';
    }

    // Notify listeners to update the UI with metadata
    notifyListeners();
  } catch (e) {
    print('Error fetching metadata: $e');
    // Handle error, maybe set to defaults
    _title = 'Error Fetching Metadata';
    _artist = 'Error Fetching Metadata';
    _album = 'Error Fetching Metadata';
    notifyListeners();
  }
}



  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
