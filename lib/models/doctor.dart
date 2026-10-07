class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String distance;
  final String avatarUrl;
  final bool isFavorite;

  const Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.distance,
    required this.avatarUrl,
    required this.isFavorite,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      specialty: json['specialty'] ?? '',
      distance: json['distance'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Doctor copyWith({
    bool? isFavorite,
  }) {
    return Doctor(
      id: id,
      name: name,
      specialty: specialty,
      distance: distance,
      avatarUrl: avatarUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}