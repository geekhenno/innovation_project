import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_project/core/config/app_dimensions.dart';
import 'package:innovation_project/core/constants/app_locale.dart';
import 'package:innovation_project/features/home/models/top_liked.dart';
import 'package:innovation_project/features/home/view_model/top_liked_provider.dart';
import 'package:innovation_project/features/listen_audio/views/screens/audio_view.dart';
import 'package:innovation_project/generated/assets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocale.topLiked.tr(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.separated(
              itemCount: ref.watch(topLikedProvider).length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final TopLiked item = ref.watch(topLikedProvider)[index];
                return ListTile(
                  onTap: () {
                    ref.read(topLikedProvider.notifier).setFavorite(item.id);
                  },
                  title: Text(item.title.tr()),
                  trailing: SvgPicture.asset(item.liked
                      ? Assets.iconsIcLikeFilled
                      : Assets.iconsIcLike),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
            const AudioView(),
          ],
        ),
      ),
    );
  }
}
