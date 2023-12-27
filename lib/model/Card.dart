class Card {
  final String id;
  final String name;
  final String faceId;
  final String reversedFaceId;

  Card({
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

  factory Card.fromJson(Map<String, dynamic>? json, String id) {
    return Card(
      id: id,
      name: json?['name'] ?? '',
      faceId: json?['faceId'] ?? '',
      reversedFaceId: json?['reversedFaceId'] ?? '',
    );
  }
}
