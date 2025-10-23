class Student {
  final String? id;
  final String name;
  final int age;

  Student({
    this.id,
    required this.name,
    required this.age,
  });

  Student copyWith({
    String? id,
    String? name,
    int? age,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
      other.id == id &&
      other.name == name &&
      other.age == age;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ age.hashCode;
}