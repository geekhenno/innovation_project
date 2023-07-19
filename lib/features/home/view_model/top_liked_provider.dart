import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innovation_project/core/constants/app_locale.dart';
import 'package:innovation_project/features/home/models/top_liked.dart';

final topLikedProvider =
    StateNotifierProvider<TopLikedProvider, List<TopLiked>>(
        (ref) => TopLikedProvider([
              const TopLiked(
                id: 1,
                title: AppLocale.movies,
              ),
              const TopLiked(
                id: 2,
                title: AppLocale.reading,
              ),
              const TopLiked(
                id: 3,
                title: AppLocale.swimming,
              ),
            ]));

class TopLikedProvider extends StateNotifier<List<TopLiked>> {
  TopLikedProvider(super.state);

  void setFavorite(int id) {
    state = [
      for (final TopLiked item in state)
        if (item.id == id) item.copyWith(liked: !item.liked) else item
    ];
  }
}
