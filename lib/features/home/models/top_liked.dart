class TopLiked {
  final int id;
  final String title;
  final bool liked;

  const TopLiked({
    required this.id,
    required this.title,
    this.liked = false,
  });

  TopLiked copyWith({
    int? id,
    String? title,
    bool? liked,
  }) {
    return TopLiked(
      id: id ?? this.id,
      title: title ?? this.title,
      liked: liked ?? this.liked,
    );
  }
}
