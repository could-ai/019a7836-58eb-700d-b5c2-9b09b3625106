enum EventType { show, rehearsal, recording }

class Event {
  final String id;
  final String title;
  final EventType type;
  final DateTime date;
  final String time;
  final String location;
  final String? setlistId;
  final String? checklistId;
  final bool notifications;
  final String notes;

  Event({
    required this.id,
    required this.title,
    required this.type,
    required this.date,
    required this.time,
    required this.location,
    this.setlistId,
    this.checklistId,
    this.notifications = false,
    this.notes = '',
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'type': type.name,
        'date': date.toIso8601String(),
        'time': time,
        'location': location,
        'setlistId': setlistId,
        'checklistId': checklistId,
        'notifications': notifications,
        'notes': notes,
      };

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json['id'],
        title: json['title'],
        type: EventType.values.firstWhere(
          (e) => e.name == json['type'],
          orElse: () => EventType.show,
        ),
        date: DateTime.parse(json['date']),
        time: json['time'],
        location: json['location'],
        setlistId: json['setlistId'],
        checklistId: json['checklistId'],
        notifications: json['notifications'] ?? false,
        notes: json['notes'] ?? '',
      );

  Event copyWith({
    String? id,
    String? title,
    EventType? type,
    DateTime? date,
    String? time,
    String? location,
    String? setlistId,
    String? checklistId,
    bool? notifications,
    String? notes,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      date: date ?? this.date,
      time: time ?? this.time,
      location: location ?? this.location,
      setlistId: setlistId ?? this.setlistId,
      checklistId: checklistId ?? this.checklistId,
      notifications: notifications ?? this.notifications,
      notes: notes ?? this.notes,
    );
  }
}
