// class Student {
//   final String? id;
//   final String name;
//   final int age;

//   Student({
//     this.id,
//     required this.name,
//     required this.age,
//   });

//   Student copyWith({
//     String? id,
//     String? name,
//     int? age,
//   }) {
//     return Student(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       age: age ?? this.age,
//     );
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
  
//     return other is Student &&
//       other.id == id &&
//       other.name == name &&
//       other.age == age;
//   }

//   @override
//   int get hashCode => id.hashCode ^ name.hashCode ^ age.hashCode;
// }

class Student {
  final String? id;
  final String name;
  final int age;
  final String? email;
  final String? phone;
  final DateTime createdAt;
  final DateTime updatedAt;

   Student({
    this.id,
    required this.name,
    required this.age,
    this.email,
    this.phone,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Student copyWith({
    String? id,
    String? name,
    int? age,
    String? email,
    String? phone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'phone': phone,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      email: json['email'],
      phone: json['phone'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt']),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
        other.id == id &&
        other.name == name &&
        other.age == age &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ age.hashCode ^ email.hashCode ^ phone.hashCode;
  }

  String get formattedCreatedAt => '${createdAt.day}/${createdAt.month}/${createdAt.year}';
  String get formattedUpdatedAt => '${updatedAt.day}/${updatedAt.month}/${updatedAt.year}';
}