final class Story {
  final int id;
  final String title;
  final DateTime createdAt;
  final String createdBy;
  final int score;
  final int commentCount;
  final List<int> listOfComments;
  final String? url;
  final String? text;

  const Story({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.createdBy,
    required this.score,
    required this.commentCount,
    required this.listOfComments,
    this.url,
    this.text,
  });
}
