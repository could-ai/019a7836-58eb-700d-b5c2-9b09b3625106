class Song {
  final String id;
  final String title;
  final String artist;
  final String key;
  final int bpm;
  final String duration;
  final String lyrics;
  final String chords;
  final String notes;
  final String genre;
  final DateTime createdAt;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.key,
    required this.bpm,
    required this.duration,
    required this.lyrics,
    required this.chords,
    required this.notes,
    required this.genre,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'artist': artist,
        'key': key,
        'bpm': bpm,
        'duration': duration,
        'lyrics': lyrics,
        'chords': chords,
        'notes': notes,
        'genre': genre,
        'createdAt': createdAt.toIso8601String(),
      };

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json['id'],
        title: json['title'],
        artist: json['artist'],
        key: json['key'],
        bpm: json['bpm'],
        duration: json['duration'],
        lyrics: json['lyrics'],
        chords: json['chords'],
        notes: json['notes'],
        genre: json['genre'],
        createdAt: DateTime.parse(json['createdAt']),
      );

  Song copyWith({
    String? id,
    String? title,
    String? artist,
    String? key,
    int? bpm,
    String? duration,
    String? lyrics,
    String? chords,
    String? notes,
    String? genre,
    DateTime? createdAt,
  }) {
    return Song(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      key: key ?? this.key,
      bpm: bpm ?? this.bpm,
      duration: duration ?? this.duration,
      lyrics: lyrics ?? this.lyrics,
      chords: chords ?? this.chords,
      notes: notes ?? this.notes,
      genre: genre ?? this.genre,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
