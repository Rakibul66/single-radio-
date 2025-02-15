import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler extends BaseAudioHandler {
  final AudioPlayer _player = AudioPlayer();

  AudioPlayerHandler() {
    _init();
  }

  Future<void> _init() async {
    // Initialize player with a sample URL, replace with your actual URL
    await _player.setUrl('http://stream-uk1.radioparadise.com/aac-320');
  }

  @override
  Future<void> play() async {
    await _player.play();
    super.play();
  }

  @override
  Future<void> pause() async {
    await _player.pause();
    super.pause();
  }

  @override
  Future<void> stop() async {
    await _player.stop();
    super.stop();
  }

Stream<PlaybackState> get playbackStateStream {
  return _player.playerStateStream.map((state) {
    return PlaybackState(
      playing: state.playing,
      processingState: _mapProcessingState(state.processingState),
      updateTime: DateTime.now().add(_player.position), // Convert Duration to DateTime
      speed: _player.speed,  // Get the current speed directly from _player
    );
  });
}


// Helper method to convert ProcessingState to AudioProcessingState
AudioProcessingState _mapProcessingState(ProcessingState state) {
  switch (state) {
    case ProcessingState.idle:
      return AudioProcessingState.idle;  // Use 'idle' instead of 'none'
    case ProcessingState.loading:
      return AudioProcessingState.buffering;
    case ProcessingState.buffering:
      return AudioProcessingState.buffering;
    case ProcessingState.ready:
      return AudioProcessingState.ready;
    case ProcessingState.completed:
      return AudioProcessingState.completed;
    default:
      return AudioProcessingState.idle;  // Default to 'idle'
  }
}
}