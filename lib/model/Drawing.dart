class Drawing {
  final String id;
  final String userId;
  final DateTime drawingDate;
  final List<String> cardFaceIds;
  final int objectiveNote;
  final int subjectiveNote;


  Drawing({
    required this.id,
    required this.userId,
    required this.drawingDate,
    required this.cardFaceIds,
    required this.objectiveNote,
    required this.subjectiveNote,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId' : userId,
        'drawingDate' : drawingDate,
        'cardFaceIds': cardFaceIds,
        'objectiveNote' : objectiveNote,
        'subjectiveNote' : subjectiveNote,
      };

  factory Drawing.fromJson(Map<String, dynamic>? json, String id) {
    return Drawing(
      id: id,
      userId: json?['userId'] ?? '',
      drawingDate: DateTime.parse(json?['drawingDate'] ?? ''),
      cardFaceIds: List<String>.from(json?['cardFaceIds'] ?? []),
      objectiveNote: json?['objectiveNote'] ?? 0,
      subjectiveNote: json?['subjectiveNote'] ?? 0,
    );
  }
}
