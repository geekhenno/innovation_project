import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovation_project/core/network/api_client.dart';
import 'package:innovation_project/core/network/dio_client.dart';
import 'package:innovation_project/core/network/endpoints/api_endpoints.dart';
import 'package:innovation_project/core/network/errors/failure.dart';
import 'package:innovation_project/features/listen_audio/models/audio_file.dart';
import 'package:innovation_project/features/listen_audio/repositories/audio_file_repository.dart';

final remoteAudioFileRepository = Provider(
  (ref) => RemoteAudioFileRepository(
    ref.watch(dioClientProvider),
  ),
);

class RemoteAudioFileRepository extends AudioFileRepository {
  final ApiClient _apiClient;
  RemoteAudioFileRepository(this._apiClient);
  @override
  Future<Either<Failure, AudioFile>> getAudioFile() async {
    try {
      final response = await _apiClient.get(ApiEndpoints.audio);
      return Right(
        AudioFile.fromJson(response['audio_file']),
      );
    } catch (e, stackTrace) {
      return Left(UnknownFailure(
        message: e.toString(),
        stackTrace: stackTrace,
      ));
    }
  }
}
