/// Tracks progress for a specific learning content item
class ContentProgress {
  final String userId;
  final String contentId;
  final String categoryId;
  final int progressPercentage; // 0-100
  final DateTime lastAccessedAt;
  final DateTime? completedAt;
  final bool isCompleted;
  final int? currentPage; // For PDFs
  final Duration? videoPlaybackPosition; // For videos
  final List<String> noteTags; // For highlighting in notes
  final String? bookmarkContent; // Bookmarked section

  ContentProgress({
    required this.userId,
    required this.contentId,
    required this.categoryId,
    this.progressPercentage = 0,
    required this.lastAccessedAt,
    this.completedAt,
    this.isCompleted = false,
    this.currentPage,
    this.videoPlaybackPosition,
    this.noteTags = const [],
    this.bookmarkContent,
  });

  factory ContentProgress.fromMap(Map<String, dynamic> map) {
    return ContentProgress(
      userId: map['userId'] ?? '',
      contentId: map['contentId'] ?? '',
      categoryId: map['categoryId'] ?? '',
      progressPercentage: map['progressPercentage'] ?? 0,
      lastAccessedAt: DateTime.parse(
        map['lastAccessedAt'] ?? DateTime.now().toIso8601String(),
      ),
      completedAt: map['completedAt'] != null
          ? DateTime.parse(map['completedAt'])
          : null,
      isCompleted: map['isCompleted'] ?? false,
      currentPage: map['currentPage'],
      videoPlaybackPosition: map['videoPlaybackPosition'] != null
          ? Duration(seconds: map['videoPlaybackPosition'])
          : null,
      noteTags: List<String>.from(map['noteTags'] ?? []),
      bookmarkContent: map['bookmarkContent'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'contentId': contentId,
      'categoryId': categoryId,
      'progressPercentage': progressPercentage,
      'lastAccessedAt': lastAccessedAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'isCompleted': isCompleted,
      'currentPage': currentPage,
      'videoPlaybackPosition': videoPlaybackPosition?.inSeconds,
      'noteTags': noteTags,
      'bookmarkContent': bookmarkContent,
    };
  }

  ContentProgress copyWith({
    String? userId,
    String? contentId,
    String? categoryId,
    int? progressPercentage,
    DateTime? lastAccessedAt,
    DateTime? completedAt,
    bool? isCompleted,
    int? currentPage,
    Duration? videoPlaybackPosition,
    List<String>? noteTags,
    String? bookmarkContent,
  }) {
    return ContentProgress(
      userId: userId ?? this.userId,
      contentId: contentId ?? this.contentId,
      categoryId: categoryId ?? this.categoryId,
      progressPercentage: progressPercentage ?? this.progressPercentage,
      lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
      completedAt: completedAt ?? this.completedAt,
      isCompleted: isCompleted ?? this.isCompleted,
      currentPage: currentPage ?? this.currentPage,
      videoPlaybackPosition:
          videoPlaybackPosition ?? this.videoPlaybackPosition,
      noteTags: noteTags ?? this.noteTags,
      bookmarkContent: bookmarkContent ?? this.bookmarkContent,
    );
  }
}

/// Tracks progress for an entire category
class CategoryProgress {
  final String userId;
  final String categoryId;
  final int totalContentItems;
  final int completedItems;
  final int averageProgress; // Overall percentage
  final DateTime lastAccessedAt;
  final List<String> completedContentIds;

  CategoryProgress({
    required this.userId,
    required this.categoryId,
    this.totalContentItems = 0,
    this.completedItems = 0,
    this.averageProgress = 0,
    required this.lastAccessedAt,
    this.completedContentIds = const [],
  });

  int get pendingItems => totalContentItems - completedItems;

  double get completionPercentage {
    if (totalContentItems == 0) return 0;
    return (completedItems / totalContentItems) * 100;
  }

  factory CategoryProgress.fromMap(Map<String, dynamic> map) {
    return CategoryProgress(
      userId: map['userId'] ?? '',
      categoryId: map['categoryId'] ?? '',
      totalContentItems: map['totalContentItems'] ?? 0,
      completedItems: map['completedItems'] ?? 0,
      averageProgress: map['averageProgress'] ?? 0,
      lastAccessedAt: DateTime.parse(
        map['lastAccessedAt'] ?? DateTime.now().toIso8601String(),
      ),
      completedContentIds: List<String>.from(map['completedContentIds'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'categoryId': categoryId,
      'totalContentItems': totalContentItems,
      'completedItems': completedItems,
      'averageProgress': averageProgress,
      'lastAccessedAt': lastAccessedAt.toIso8601String(),
      'completedContentIds': completedContentIds,
    };
  }
}

/// Offline-synced note with formatting
class HighlightedNote {
  final String id;
  final String userId;
  final String contentId;
  final String title;
  final String body; // Main note content
  final List<HighlightedKeyword> keywords;
  final List<NoteBullet> bullets;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSyncedToCloud;

  HighlightedNote({
    required this.id,
    required this.userId,
    required this.contentId,
    required this.title,
    required this.body,
    this.keywords = const [],
    this.bullets = const [],
    required this.createdAt,
    required this.updatedAt,
    this.isSyncedToCloud = false,
  });

  factory HighlightedNote.fromMap(Map<String, dynamic> map) {
    return HighlightedNote(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      contentId: map['contentId'] ?? '',
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      keywords:
          (map['keywords'] as List?)
              ?.map((k) => HighlightedKeyword.fromMap(k))
              .toList() ??
          [],
      bullets:
          (map['bullets'] as List?)
              ?.map((b) => NoteBullet.fromMap(b))
              .toList() ??
          [],
      createdAt: DateTime.parse(
        map['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      updatedAt: DateTime.parse(
        map['updatedAt'] ?? DateTime.now().toIso8601String(),
      ),
      isSyncedToCloud: map['isSyncedToCloud'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'contentId': contentId,
      'title': title,
      'body': body,
      'keywords': keywords.map((k) => k.toMap()).toList(),
      'bullets': bullets.map((b) => b.toMap()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isSyncedToCloud': isSyncedToCloud,
    };
  }
}

/// Represents a highlighted keyword in a note
class HighlightedKeyword {
  final String word;
  final String color; // Hex color code for highlight
  final String definition; // Optional definition tooltip

  HighlightedKeyword({
    required this.word,
    required this.color,
    this.definition = '',
  });

  factory HighlightedKeyword.fromMap(Map<String, dynamic> map) {
    return HighlightedKeyword(
      word: map['word'] ?? '',
      color: map['color'] ?? '#FFFF00',
      definition: map['definition'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'word': word, 'color': color, 'definition': definition};
  }
}

/// Represents a bullet point in a note
class NoteBullet {
  final String text;
  final int indentLevel; // 0, 1, 2 for nesting
  final bool isChecked; // For checklists

  NoteBullet({
    required this.text,
    this.indentLevel = 0,
    this.isChecked = false,
  });

  factory NoteBullet.fromMap(Map<String, dynamic> map) {
    return NoteBullet(
      text: map['text'] ?? '',
      indentLevel: map['indentLevel'] ?? 0,
      isChecked: map['isChecked'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {'text': text, 'indentLevel': indentLevel, 'isChecked': isChecked};
  }
}
