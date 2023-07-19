import 'package:dartz/dartz.dart';
import 'package:innovation_project/core/network/errors/failure.dart';
import 'package:innovation_project/features/listen_audio/models/audio_file.dart';

abstract class AudioFileRepository {
  Future<Either<Failure, AudioFile>> getAudioFile();
}
