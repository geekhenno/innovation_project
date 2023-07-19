import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovation_project/core/models/provider/view_state.dart';
import 'package:innovation_project/core/network/errors/failure.dart';
import 'package:innovation_project/features/listen_audio/models/audio_file.dart';
import 'package:innovation_project/features/listen_audio/repositories/audio_file_repository.dart';
import 'package:innovation_project/features/listen_audio/repositories/remote_audio_file_repository.dart';

final audioFileProvider = StateNotifierProvider(
  (ref) => AudioFileProvider(
    ref.watch(remoteAudioFileRepository),
  )..getAudioFile(),
);

class AudioFileProvider extends StateNotifier<ViewState> {
  final AudioFileRepository _audioFileRepository;
  AudioFileProvider(this._audioFileRepository) : super(InitialViewState());

  Future<void> getAudioFile() async {
    state = LoadingViewState();
    final Either<Failure, AudioFile> response =
        await _audioFileRepository.getAudioFile();
    return response.fold(
      (Failure failure) => state = ErrorViewState(
        errorMessage: failure.message,
      ),
      (AudioFile audioFile) => state = LoadedViewState<AudioFile>(audioFile),
    );
  }
}
