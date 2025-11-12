enum TaskCategory { equipment, transport, wardrobe, other }

class ChecklistItem {
  final String id;
  final String name;
  final TaskCategory category;
  final bool completed;
  final String? eventId;
  final DateTime createdAt;

  ChecklistItem({
    required this.id,
    required this.name,
    required this.category,
    required this.completed,
    this.eventId,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category.name,
        'completed': completed,
        'eventId': eventId,
        'createdAt': createdAt.toIso8601String(),
      };

  factory ChecklistItem.fromJson(Map<String, dynamic> json) => ChecklistItem(
        id: json['id'],
        name: json['name'],
        category: TaskCategory.values.firstWhere(
          (c) => c.name == json['category'],
          orElse: () => TaskCategory.other,
        ),
        completed: json['completed'] ?? false,
        eventId: json['eventId'],
        createdAt: DateTime.parse(json['createdAt']),
      );

  ChecklistItem copyWith({
    String? id,
    String? name,
    TaskCategory? category,
    bool? completed,
    String? eventId,
    DateTime? createdAt,
  }) {
    return ChecklistItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      completed: completed ?? this.completed,
      eventId: eventId ?? this.eventId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
