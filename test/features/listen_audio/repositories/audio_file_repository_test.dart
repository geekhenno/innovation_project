import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innovation_project/features/listen_audio/models/audio_file.dart';
import 'package:innovation_project/features/listen_audio/repositories/audio_file_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'audio_file_repository_test.mocks.dart';

class AudioFileRepositoryTest extends Mock implements AudioFileRepository {}

@GenerateMocks([AudioFileRepositoryTest])
Future<void> main() async {
  late MockAudioFileRepositoryTest audioRepo;

  setUpAll(() {
    audioRepo = MockAudioFileRepositoryTest();
  });

  group('success audio repo test', () {
    test('test fetch audio', () async {
      const audio = AudioFile(
        id: 1,
        chapterId: 123,
        fileSize: 0.65,
        format: 'mp3',
        audioUrl:
            'https://download.quranicaudio.com/qdc/abdul_baset/mujawwad/1.mp3',
      );

      when(audioRepo.getAudioFile()).thenAnswer((_) async {
        return const Right(audio);
      });

      final res = await audioRepo.getAudioFile();

      expect(res, isA<Right>());
      expect(res, const Right(audio));
    });
  });

  group('Failure audio repo test', () {
    test('test fetchData throws Exception', () {
      when(audioRepo.getAudioFile()).thenAnswer((_) async {
        throw Exception();
      });

      final res = audioRepo.getAudioFile();

      expect(res, throwsException);
    });
  });
}
