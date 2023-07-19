import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';

enum AudioStatus {
  init,
  loading,
  stopped,
  paused,
  played,
  buffering,
  ready,
  completed,
}

class AudioController with ChangeNotifier {
  AudioController() {
    _init();
  }
  final _player = AudioPlayer();
  AudioStatus _audioStatus = AudioStatus.init;
  AudioStatus get audioStatus => _audioStatus;
  int _duration = 0;

  _init() {
    _player.positionStream.listen((event) {
      _duration = event.inSeconds;
    });
    _player.playerStateStream.listen((state) {
      switch (state.processingState) {
        case ProcessingState.idle:
          _audioStatus = AudioStatus.init;
          break;
        case ProcessingState.loading:
          _audioStatus = AudioStatus.loading;
          notifyListeners();
          break;
        case ProcessingState.buffering:
          _audioStatus = AudioStatus.buffering;
          break;
        case ProcessingState.ready:
          if (state.playing) {
            _audioStatus = AudioStatus.played;
            notifyListeners();
            return;
          }
          notifyListeners();
          break;
        case ProcessingState.completed:
          _stop();
          break;
      }
    });
  }

  Future<void> play({required String url}) async {
    try {
      if (_audioStatus == AudioStatus.played) {
        _pause();
        return;
      }
      if (_audioStatus == AudioStatus.paused) {
        _resume();
        return;
      }
      final audioSource = LockCachingAudioSource(Uri.parse(url));
      await _player.setAudioSource(audioSource);
      _player.play();
      _audioStatus = AudioStatus.played;
      notifyListeners();
    } catch (e) {
      _audioStatus = AudioStatus.init;
    } finally {
      notifyListeners();
    }
  }

  Future<void> _pause() async {
    _player.pause();
    _audioStatus = AudioStatus.paused;
    notifyListeners();
  }

  Future<void> _resume() async {
    await _player.seek(Duration(seconds: _duration));
    _player.play();
  }

  Future<void> _stop() async {
    _audioStatus = AudioStatus.stopped;
    notifyListeners();
  }
}
