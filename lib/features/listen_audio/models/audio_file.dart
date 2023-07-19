import 'package:json_annotation/json_annotation.dart';
part 'audio_file.g.dart';

@JsonSerializable()
class AudioFile {
  final int id;
  @JsonKey(name: 'chapter_id')
  final int chapterId;
  @JsonKey(name: 'file_size')
  final double fileSize;
  final String format;
  @JsonKey(name: 'audio_url')
  final String audioUrl;

  const AudioFile({
    required this.id,
    required this.chapterId,
    required this.fileSize,
    required this.format,
    required this.audioUrl,
  });

  factory AudioFile.fromJson(Map<String, dynamic> json) =>
      _$AudioFileFromJson(json);

  Map<String, dynamic> toJson() => _$AudioFileToJson(this);
}
