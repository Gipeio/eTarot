class TarotCard {
  final String id;
  final String name;
  final String faceId;
  final String reversedFaceId;

  TarotCard({
    required this.id,
    required this.name,
    required this.faceId,
    required this.reversedFaceId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'face': faceId,
        'reversedFace': reversedFaceId,
      };

  factory TarotCard.fromJson(Map<String, dynamic>? json, String id) {
    return TarotCard(
      id: id,
      name: json?['name'] ?? '',
      faceId: json?['faceId'] ?? '',
      reversedFaceId: json?['reversedFaceId'] ?? '',
    );
  }
}
