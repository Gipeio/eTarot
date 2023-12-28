class CardFace {
  final String id;
  final String meaning;
  final int note;

  CardFace({
    required this.id,
    required this.meaning,
    required this.note,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'meaning': meaning,
        'note': note,
      };

  factory CardFace.fromJson(Map<String, dynamic>? json, String id) {
    return CardFace(
      id: id,
      meaning: json?['meaning'] ?? '',
      note: json?['note'] ?? 0,
    );
  }
}
