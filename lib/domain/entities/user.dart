class User {
  final String id;
  final String email;
  final String name;
  final DateTime createdAt;
  final DateTime? lastLogin;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.createdAt,
    this.lastLogin,
  });

  User copyWith({
    String? id,
    String? email,
    String? name,
    DateTime? createdAt,
    DateTime? lastLogin,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'lastLogin': lastLogin?.millisecondsSinceEpoch,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
      lastLogin: json['lastLogin'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(json['lastLogin'])
          : null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;
}