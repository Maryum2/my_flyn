class Campaign {
  final String id;
  final String title;
  final String thumbnailUrl;
  final String tag;
  final String size;
  bool liked;

  Campaign({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
    this.tag = 'F&B',
    this.size = '335 × 100',
    this.liked = false,
  });
}
