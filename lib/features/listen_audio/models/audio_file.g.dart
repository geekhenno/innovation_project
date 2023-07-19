// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioFile _$AudioFileFromJson(Map<String, dynamic> json) => AudioFile(
      id: json['id'] as int,
      chapterId: json['chapter_id'] as int,
      fileSize: (json['file_size'] as num).toDouble(),
      format: json['format'] as String,
      audioUrl: json['audio_url'] as String,
    );

Map<String, dynamic> _$AudioFileToJson(AudioFile instance) => <String, dynamic>{
      'id': instance.id,
      'chapter_id': instance.chapterId,
      'file_size': instance.fileSize,
      'format': instance.format,
      'audio_url': instance.audioUrl,
    };
