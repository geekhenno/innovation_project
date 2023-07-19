import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_project/core/config/app_dimensions.dart';
import 'package:innovation_project/core/constants/app_locale.dart';
import 'package:innovation_project/core/models/provider/view_state.dart';
import 'package:innovation_project/core/services/audio_service/audio_controller.dart';
import 'package:innovation_project/features/listen_audio/models/audio_file.dart';
import 'package:innovation_project/features/listen_audio/view_model/audio_file_provider.dart';
import 'package:innovation_project/generated/assets.dart';

class AudioView extends ConsumerStatefulWidget {
  const AudioView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AudiViewState();
}

class _AudiViewState extends ConsumerState<AudioView> {
  final AudioController _audioController = AudioController();
  AudioStatus _audioStatus = AudioStatus.init;

  @override
  void initState() {
    super.initState();

    _audioController.addListener(_checkAudioStatus);
  }

  @override
  void dispose() {
    _audioController.removeListener(_checkAudioStatus);
    super.dispose();
  }

  void _checkAudioStatus() {
    setState(() {
      _audioStatus = _audioController.audioStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final audioState = ref.watch(audioFileProvider);
    if (audioState is LoadingViewState) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (audioState is ErrorViewState) {
      return Center(
        child: Text(audioState.errorMessage),
      );
    }
    if (audioState is LoadedViewState<AudioFile>) {
      return Center(
        child: CupertinoButton(
          onPressed: _audioStatus == AudioStatus.loading
              ? null
              : () {
                  _audioController.play(url: audioState.data.audioUrl);
                },
          child: Row(
            children: [
              _audioStatus == AudioStatus.loading
                  ? const CircularProgressIndicator.adaptive()
                  : SvgPicture.asset(
                      _audioStatus == AudioStatus.played
                          ? Assets.iconsIcPause
                          : Assets.iconsIcPlay,
                    ),
              const SizedBox(
                width: AppDimensions.medium,
              ),
              Text(AppLocale.play.tr()),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
