class Setlist {
  final String id;
  final String name;
  final List<String> songIds;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? shareLink;

  Setlist({
    required this.id,
    required this.name,
    required this.songIds,
    required this.createdAt,
    this.updatedAt,
    this.shareLink,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'songIds': songIds,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'shareLink': shareLink,
      };

  factory Setlist.fromJson(Map<String, dynamic> json) => Setlist(
        id: json['id'],
        name: json['name'],
        songIds: List<String>.from(json['songIds'] ?? []),
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] != null
            ? DateTime.parse(json['updatedAt'])
            : null,
        shareLink: json['shareLink'],
      );

  Setlist copyWith({
    String? id,
    String? name,
    List<String>? songIds,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? shareLink,
  }) {
    return Setlist(
      id: id ?? this.id,
      name: name ?? this.name,
      songIds: songIds ?? this.songIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      shareLink: shareLink ?? this.shareLink,
    );
  }
}
