class LearningContent {
  String id;
  String title;
  String content;
  String type; // note, video, pdf
  String category;
  String? url; // for video or pdf links

  LearningContent({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.category,
    this.url,
  });

  factory LearningContent.fromMap(Map<String, dynamic> map) {
    return LearningContent(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      type: map['type'] ?? 'note',
      category: map['category'] ?? '',
      url: map['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'type': type,
      'category': category,
      'url': url,
    };
  }
}