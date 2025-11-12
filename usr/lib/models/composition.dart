class Composition {
  final String id;
  final String title;
  final String content;
  final String folder;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Composition({
    required this.id,
    required this.title,
    required this.content,
    required this.folder,
    required this.tags,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'folder': folder,
        'tags': tags,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  factory Composition.fromJson(Map<String, dynamic> json) => Composition(
        id: json['id'],
        title: json['title'],
        content: json['content'],
        folder: json['folder'],
        tags: List<String>.from(json['tags'] ?? []),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
      );

  Composition copyWith({
    String? id,
    String? title,
    String? content,
    String? folder,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Composition(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      folder: folder ?? this.folder,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
