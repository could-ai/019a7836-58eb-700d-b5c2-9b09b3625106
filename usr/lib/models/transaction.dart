enum TransactionType { income, expense }

class Transaction {
  final String id;
  final TransactionType type;
  final double amount;
  final String category;
  final String description;
  final DateTime date;
  final String? eventId;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
    this.eventId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.name,
        'amount': amount,
        'category': category,
        'description': description,
        'date': date.toIso8601String(),
        'eventId': eventId,
      };

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json['id'],
        type: TransactionType.values.firstWhere(
          (t) => t.name == json['type'],
          orElse: () => TransactionType.expense,
        ),
        amount: (json['amount'] as num).toDouble(),
        category: json['category'],
        description: json['description'],
        date: DateTime.parse(json['date']),
        eventId: json['eventId'],
      );

  Transaction copyWith({
    String? id,
    TransactionType? type,
    double? amount,
    String? category,
    String? description,
    DateTime? date,
    String? eventId,
  }) {
    return Transaction(
      id: id ?? this.id,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      description: description ?? this.description,
      date: date ?? this.date,
      eventId: eventId ?? this.eventId,
    );
  }
}
