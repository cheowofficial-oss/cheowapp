class UserModel {
  final String id;
  final String? email;
  final String? username;
  final String? displayName;
  final bool isPremium;
  final DateTime createdAt;

  UserModel({
    required this.id,
    this.email,
    this.username,
    this.displayName,
    this.isPremium = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        email: json['email'] as String?,
        username: json['username'] as String?,
        displayName: json['display_name'] as String?,
        isPremium: json['is_premium'] as bool? ?? false,
        createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'] as String) : DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'username': username,
        'display_name': displayName,
        'is_premium': isPremium,
        'created_at': createdAt.toIso8601String(),
      };
}
