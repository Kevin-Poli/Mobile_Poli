class UserModel {
  final String username;
  final String role;
  final String? email;
  final String? photoUrl;

  UserModel({
    required this.username,
    this.role = 'Demo User',
    this.email,
    this.photoUrl,
  });

  // Convert model to Map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'role': role,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  // Create model from Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      role: map['role'] ?? 'Demo User',
      email: map['email'],
      photoUrl: map['photoUrl'],
    );
  }

  // Clone with new values
  UserModel copyWith({
    String? username,
    String? role,
    String? email,
    String? photoUrl,
  }) {
    return UserModel(
      username: username ?? this.username,
      role: role ?? this.role,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}